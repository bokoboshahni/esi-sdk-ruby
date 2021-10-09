# frozen_string_literal: true

require "httpx"
require "timeout"

require_relative "./errors"
require_relative "./client/alliance"
require_relative "./client/contacts"
require_relative "./client/character"
require_relative "./client/assets"
require_relative "./client/skills"
require_relative "./client/bookmarks"
require_relative "./client/calendar"
require_relative "./client/clones"
require_relative "./client/contracts"
require_relative "./client/fittings"
require_relative "./client/fleets"
require_relative "./client/faction_warfare"
require_relative "./client/industry"
require_relative "./client/killmails"
require_relative "./client/location"
require_relative "./client/loyalty"
require_relative "./client/mail"
require_relative "./client/opportunities"
require_relative "./client/market"
require_relative "./client/planetary_interaction"
require_relative "./client/search"
require_relative "./client/wallet"
require_relative "./client/corporation"
require_relative "./client/dogma"
require_relative "./client/incursions"
require_relative "./client/insurance"
require_relative "./client/routes"
require_relative "./client/sovereignty"
require_relative "./client/status"
require_relative "./client/user_interface"
require_relative "./client/universe"
require_relative "./client/wars"

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

    DEFAULT_BASE_URL = "https://esi.evetech.net"
    DEFAULT_VERSION = "latest"

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

    attr_reader :base_url, :cache, :instrumentation, :logger, :user_agent, :version

    # Returns a new {ESI::Client}.
    #
    # See the [faraday-http-cache](https://github.com/sourcelevel/faraday-http-cache) documentation for information on
    # how to set up caching via the `cache` parameter.
    #
    # @param user_agent [String] Value of the `User-Agent` header for HTTP calls
    # @param base_url [String] The base URL of the ESI API
    # @param version [String] The version of the ESI API
    # @param logger [Object] The logger to use
    # @param cache [Hash] The cache configuration to use
    # @option cache [Object] :store The cache store (e.g. `Rails.cache`)
    # @option cache [Object] :logger The logger (e.g. `Rails.logger`)
    # @option cache [Object] :instrumenter The instrumenter (e.g. `ActiveSupport::Notifications`)
    # @param instrumentation [Hash] The instrumentation configuration to use
    # @option instrumentation [String] :name The name to use for instrumentation
    # @option instrumentation [Object] :instrumenter The instrumenter to use (e.g. `ActiveSupport::Notifications`)
    def initialize(user_agent:, base_url: DEFAULT_BASE_URL, version: DEFAULT_VERSION, cache: {}, instrumentation: {}, logger: nil) # rubocop:disable Layout/LineLength, Metrics/ParameterLists
      @base_url = base_url
      @cache = cache
      @instrumentation = instrumentation
      @user_agent = user_agent
      @version = version
      @logger = logger
    end

    # Set the `Authorization` header for subsequent requests.
    #
    # @param token [String] The [EVE SSO JWT token](https://docs.esi.evetech.net/docs/sso/) to use
    def authorize(token)
      session.authentication token
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

    def make_request(method, path, params: {}, headers: {}, payload: nil)
      versioned_path = "/#{version}#{path}"
      response = session.request(method, versioned_path, params: params, headers: headers, json: payload)
      response.raise_for_status

      return paginate(response, versioned_path, params, headers) if paginated?(response)

      response
    rescue HTTPX::Error
      raise_error(response)
    end

    def paginate(response, path, params, headers) # rubocop:disable Metrics/MethodLength
      response_headers = normalize_headers(response.headers)
      page_count = response_headers["x-pages"].to_i

      requests = (2..page_count).map do |n|
        session.build_request(:get, path, params: params.merge(page: n), headers: headers)
      end
      responses = requests.any? ? session.request(*requests) : []
      responses.unshift(response)

      if responses.any?(&:error)
        raise ESI::Errors::PaginationError.new("Error paginating request", responses: responses)
      end

      responses
    end

    def paginated?(response)
      headers = normalize_headers(response.headers)
      headers.key?("x-pages")
    end

    def concat_responses(responses)
      responses.map(&:json).reduce([], :concat)
    end

    def normalize_headers(headers)
      headers.to_h.transform_keys(&:downcase)
    end

    def raise_error(res)
      raise (ERROR_MAPPING[res.status] || ESI::Errors::ClientError).new("(#{res.status}) #{res.json["error"]}",
                                                                        response: res)
    end

    def session
      @session ||= HTTPX.with(origin: base_url)
                        .with_headers(default_headers)
                        .plugin(:authentication)
                        .plugin(:persistent)
                        .plugin(:response_cache)
                        .plugin(:retries)
    end

    def default_headers
      { "User-Agent": user_agent, Accept: "application/json" }
    end
  end
end
