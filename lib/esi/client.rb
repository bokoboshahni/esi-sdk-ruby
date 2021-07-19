# frozen_string_literal: true

require "faraday"
require "faraday-http-cache"
require "faraday_middleware"
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

    attr_reader :base_url, :cache, :user_agent, :version

    # Returns a new {ESI::Client}.
    #
    # See the [faraday-http-cache](https://github.com/sourcelevel/faraday-http-cache) documentation for information on
    # how to set up caching via the `cache` parameter.
    #
    # @param user_agent [String] Value of the `User-Agent` header for HTTP calls
    # @param base_url [String] The base URL of the ESI API
    # @param version [String] The version of the ESI API
    # @param cache [Hash] The cache configuration to use
    # @option cache [Object] :store The cache store (e.g. `Rails.cache`)
    # @option cache [Object] :logger The logger (e.g. `Rails.logger`)
    # @option cache [Object] :instrumenter The instrumenter (e.g. `ActiveSupport::Notifications`)
    def initialize(user_agent:, base_url: DEFAULT_BASE_URL, version: DEFAULT_VERSION, cache: {})
      @base_url = base_url
      @cache = cache
      @user_agent = user_agent
      @version = version
    end

    # Set the `Authorization` header for subsequent requests.
    #
    # @param token [String] The [EVE SSO JWT token](https://docs.esi.evetech.net/docs/sso/) to use
    def authorize(token)
      url_encoded_connection.authorization :Bearer, token
      json_encoded_connection.authorization :Bearer, token
    end

    private

    ESI_RETRY_EXCEPTIONS = [Errno::ETIMEDOUT, Timeout::Error, Faraday::TimeoutError, Faraday::ConnectionFailed,
                            Faraday::ParsingError, SocketError].freeze

    def delete(path, params: {}, headers: {})
      response = make_delete_request(path, params: params, headers: headers)
      response.body
    end

    def get(path, params: {}, headers: {})
      response = make_get_request(path, params: params, headers: headers)

      return paginate(response, params, headers) if paginated?(response)

      response.body
    end

    def post(path, payload: {}, headers: {})
      response = make_post_request(path, payload: payload, headers: headers)
      response.body
    end

    def put(path, payload: {}, headers: {})
      response = make_put_request(path, payload: payload, headers: headers)
      response.body
    end

    def paginate(response, params, headers)
      all_items = response.body
      page_count = response.headers["X-Pages"].to_i - 1
      page_count.times do |n|
        page_number = n + 1
        params = params.merge(page: page_number)
        page = make_get_request(path, params: params, headers: headers)
        all_items += page.body
      end

      all_items
    end

    def make_delete_request(path, params: {}, headers: {})
      res = url_encoded_connection.delete("/#{version}#{path}", params, headers)

      raise_error(res) unless res.success?

      res
    end

    def make_get_request(path, params: {}, headers: {})
      res = url_encoded_connection.get("/#{version}#{path}", params, headers)

      raise_error(res) unless res.success?

      res
    end

    def make_post_request(path, payload: {}, headers: {})
      res = json_encoded_connection.post("/#{version}#{path}", payload, headers)

      raise_error(res) unless res.success?

      res
    end

    def make_put_request(path, payload: {}, headers: {})
      res = json_encoded_connection.put("/#{version}#{path}", payload, headers)

      raise_error(res) unless res.success?

      res
    end

    def paginated?(response)
      response.headers["X-Pages"] && response.headers["X-Pages"].to_i <= 1
    end

    def raise_error(res)
      raise (ERROR_MAPPING[res.status] || Error).new("(#{res.status}) #{res["error"]}", response: res)
    end

    def url_encoded_connection
      @url_encoded_connection ||= Faraday.new(base_url, headers: default_headers) do |f|
        f.use :http_cache, **cache unless cache.empty?
        f.request :url_encoded
        f.request :retry, { exceptions: ESI_RETRY_EXCEPTIONS }
        f.response :follow_redirects
        f.response :json
      end
    end

    def json_encoded_connection
      @json_encoded_connection ||= Faraday.new(base_url, headers: default_headers) do |f|
        f.use :http_cache, **cache unless cache.empty?
        f.request :json
        f.request :retry, { exceptions: ESI_RETRY_EXCEPTIONS }
        f.response :follow_redirects
        f.response :json
      end
    end

    def default_headers
      { "User-Agent": user_agent }
    end
  end
end
