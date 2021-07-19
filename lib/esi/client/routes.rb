# frozen_string_literal: true

module ESI
  class Client
    # ESI routes operations.
    module Route
      # Get the systems between origin and destination.
      #
      # This endpoint is cached for up to 86400 seconds.
      #
      # @esi_version dev
      # @esi_version legacy
      # @esi_version v1
      #
      # @param destination [Integer,String] destination solar system ID
      # @param origin [Integer,String] origin solar system ID
      # @param avoid [Array] avoid solar system ID(s)
      # @param connections [Array] connected solar system pairs
      # @param flag [String] route security preference
      # @param params [Hash] Additional query string parameters
      # @param headers [Hash] Additional headers
      #
      # @raise [ESI::Errors::BadRequestError] Bad request
      # @raise [ESI::Errors::NotFoundError] No route found
      # @raise [ESI::Errors::ErrorLimitedError] Error limited
      # @raise [ESI::Errors::InternalServerError] Internal server error
      # @raise [ESI::Errors::ServiceUnavailableError] Service unavailable
      # @raise [ESI::Errors::GatewayTimeoutError] Gateway timeout
      #
      # @see https://esi.evetech.net/ui/#/Routes/get_route_origin_destination
      def get_route_origin_destination(destination:, origin:, avoid:, connections:, flag:, params: {}, headers: {})
        query_string = URI.encode_www_form([["avoid", avoid], ["connections", connections], ["flag", flag]])
        get("/route/#{origin}/#{destination}/?#{query_string}", headers: headers, params: params)
      end
    end
  end
end
