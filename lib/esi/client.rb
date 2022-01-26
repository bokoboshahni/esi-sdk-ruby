# frozen_string_literal: true

require 'typhoeus'
require 'oj'
require 'retriable'
require 'timeout'

require_relative './errors'
require_relative './client/alliance'
require_relative './client/contacts'
require_relative './client/character'
require_relative './client/assets'
require_relative './client/skills'
require_relative './client/bookmarks'
require_relative './client/calendar'
require_relative './client/clones'
require_relative './client/contracts'
require_relative './client/fittings'
require_relative './client/fleets'
require_relative './client/faction_warfare'
require_relative './client/industry'
require_relative './client/killmails'
require_relative './client/location'
require_relative './client/loyalty'
require_relative './client/mail'
require_relative './client/opportunities'
require_relative './client/market'
require_relative './client/planetary_interaction'
require_relative './client/search'
require_relative './client/wallet'
require_relative './client/corporation'
require_relative './client/dogma'
require_relative './client/incursions'
require_relative './client/insurance'
require_relative './client/routes'
require_relative './client/sovereignty'
require_relative './client/status'
require_relative './client/user_interface'
require_relative './client/universe'
require_relative './client/wars'

module ESI
  # Client for the EVE Swagger Interface (ESI) API.
  class Client # rubocop:disable Metrics/ClassLength
    include ESI::Client::Alliance
    include ESI::Client::Contact
    include ESI::Client::Character
    include ESI::Client::Asset
    include ESI::Client::Skill
    include ESI::Client::Bookmark
    include ESI::Client::Calendar
    include ESI::Client::Clone
    include ESI::Client::Contract
    include ESI::Client::Fitting
    include ESI::Client::Fleet
    include ESI::Client::FactionWarfare
    include ESI::Client::Industry
    include ESI::Client::Killmail
    include ESI::Client::Location
    include ESI::Client::Loyalty
    include ESI::Client::Mail
    include ESI::Client::Opportunity
    include ESI::Client::Market
    include ESI::Client::PlanetaryInteraction
    include ESI::Client::Search
    include ESI::Client::Wallet
    include ESI::Client::Corporation
    include ESI::Client::Dogma
    include ESI::Client::Incursion
    include ESI::Client::Insurance
    include ESI::Client::Route
    include ESI::Client::Sovereignty
    include ESI::Client::Status
    include ESI::Client::UserInterface
    include ESI::Client::Universe
    include ESI::Client::War

    DEFAULT_BASE_URL = 'https://esi.evetech.net'
    DEFAULT_VERSION = 'latest'

    ERROR_MAPPING = {
      400 => ESI::Errors::BadRequestError,
      401 => ESI::Errors::UnauthorizedError,
      403 => ESI::Errors::ForbiddenError,
      404 => ESI::Errors::NotFoundError,
      420 => ESI::Errors::ErrorLimitedError,
      422 => ESI::Errors::UnprocessableEntityError,
      500 => ESI::Errors::InternalServerError,
      503 => ESI::Errors::ServiceUnavailableError,
      504 => ESI::Errors::GatewayTimeoutError,
      520 => ESI::Errors::EveServerError
    }.freeze

    attr_reader :base_url, :user_agent, :version, :authorization_token, :retries

    # Returns a new {ESI::Client}.
    #
    # @param user_agent [String] Value of the `User-Agent` header for HTTP calls
    # @param base_url [String] The base URL of the ESI API
    # @param version [String] The version of the ESI API
    # @param retries [Integer] Number of times to try a request before raising an error.
    def initialize(user_agent:, base_url: DEFAULT_BASE_URL, version: DEFAULT_VERSION, retries: 10)
      @base_url = base_url
      @user_agent = user_agent
      @version = version
      @retries = retries
    end

    # Set the `Authorization` header for subsequent requests.
    #
    # @param token [String] The [EVE SSO JWT token](https://docs.esi.evetech.net/docs/sso/) to use
    def authorize(_token)
      @authorization_token = authorization_token
    end

    # Make a `DELETE` request to the ESI endpoint.
    #
    # @param path [String] The request path, excluding version like `latest`.
    # @param params [Hash] Query string parameters to pass to the request.
    # @param headers [Hash] Headers to pass to the request.
    def delete(path, params: {}, headers: {})
      make_request(:delete, path, params: params, headers: headers)
    end

    # Make a `GET` request to the ESI endpoint.
    #
    # @param path [String] The request path, excluding version like `latest`.
    # @param params [Hash] Query string parameters to pass to the request.
    # @param headers [Hash] Headers to pass to the request.
    def get(path, params: {}, headers: {})
      make_request(:get, path, params: params, headers: headers)
    end

    # Make a `POST` request to the ESI endpoint.
    #
    # @param path [String] The request path, excluding version like `latest`.
    # @param params [Hash] Query string parameters to pass to the request.
    # @param headers [Hash] Headers to pass to the request.
    # @param payload [Hash] Payload to encode as JSON to pass to the request.
    def post(path, payload: {}, params: {}, headers: {})
      make_request(:post, path, params: params, headers: headers, payload: payload)
    end

    # Make a `PUT` request to the ESI endpoint.
    #
    # @param path [String] The request path, excluding version like `latest`.
    # @param params [Hash] Query string parameters to pass to the request.
    # @param headers [Hash] Headers to pass to the request.
    # @param payload [Hash] Payload to encode as JSON to pass to the request.
    def put(path, payload: {}, params: {}, headers: {})
      make_request(:put, path, params: params, headers: headers, payload: payload)
    end

    private

    RETRIABLE_ERRORS = [
      ESI::Errors::ErrorLimitedError,
      ESI::Errors::InternalServerError,
      ESI::Errors::ServiceUnavailableError,
      ESI::Errors::GatewayTimeoutError,
      ESI::Errors::EveServerError
    ].freeze

    def make_request(method, path, params: {}, headers: {}, payload: nil) # rubocop:disable Metrics/AbcSize, Metrics/MethodLength
      headers.merge!(Authorization: "Bearer #{authorization_token}") if authorization_token
      versioned_path = "/#{version}#{path}"
      url = "#{base_url}#{versioned_path}"
      json = payload ? Oj.dump(payload) : nil
      request = Typhoeus::Request.new(url, method: method, params: params, headers: headers, body: json)
      request.on_complete { |response| raise_error(response) unless response.success? }

      hydra.queue(request)

      with_retries(on_retry: ->(*_) { hydra.queue(request) }) { hydra.run }

      response = request.response

      return paginate(response, url, params, headers) if paginated?(response)

      response
    end

    def paginate(orig_response, url, params, headers) # rubocop:disable Metrics/AbcSize, Metrics/MethodLength
      response_headers = normalize_headers(orig_response.headers)
      page_count = response_headers['x-pages'].to_i
      pages = [orig_response]

      return pages if page_count == 1

      pending_pages = page_count.times.to_a.map { |n| n + 1 }[1..]

      with_retries do
        while pending_pages.any?
          pending_pages.each do |page|
            request = Typhoeus::Request.new(url, params: params.merge(page: page), headers: headers)
            request.on_complete do |response|
              raise_error(response) unless response.success?

              pages << response
              pending_pages.delete(page)
            end
            hydra.queue(request)
          end
          hydra.run
        end
      end

      pages.sort_by { |response| response.request.options[:params][:page].to_i }
    end

    def parse_response(response)
      Oj.load(response.body, bigdecimal_load: :float)
    end

    def paginated?(response)
      headers = normalize_headers(response.headers)
      headers.key?('x-pages')
    end

    def concat_responses(responses)
      responses.map { |r| parse_response(r) }.reduce([], :concat)
    end

    def normalize_headers(headers)
      headers.to_h.transform_keys(&:downcase)
    end

    def with_retries(opts = {}, &block)
      Retriable.retriable(retry_options.merge(opts), &block)
    end

    def retry_options
      { on: RETRIABLE_ERRORS, tries: retries }
    end

    def raise_error(res)
      json = begin
        Oj.load(res.body)
      rescue StandardError
        res.body
      end

      raise (ERROR_MAPPING[res.code] || ESI::Errors::ClientError).new("(#{res.code}) #{json['error']}",
                                                                      response: res)
    end

    def default_headers
      { 'User-Agent': user_agent, Accept: 'application/json' }
    end

    def hydra
      @hydra ||= Typhoeus::Hydra.new
    end
  end
end
