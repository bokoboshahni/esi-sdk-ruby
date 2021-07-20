# frozen_string_literal: true

module ESI
  class Client
    # ESI status operations.
    module Status
      # EVE Server status.
      #
      # This endpoint is cached for up to 30 seconds.
      #
      # @esi_version dev
      # @esi_version legacy
      # @esi_version v1
      # @esi_version v2
      #
      # @param params [Hash] Additional query string parameters
      # @param headers [Hash] Additional headers
      #
      # @raise [ESI::Errors::BadRequestError] Bad request
      # @raise [ESI::Errors::ErrorLimitedError] Error limited
      # @raise [ESI::Errors::InternalServerError] Internal server error
      # @raise [ESI::Errors::ServiceUnavailableError] Service unavailable
      # @raise [ESI::Errors::GatewayTimeoutError] Gateway timeout
      #
      # @see https://esi.evetech.net/ui/#/Status/get_status
      def get_status(headers: {}, params: {})
        get("/status/", headers: headers, params: params)
      end
    end
  end
end
