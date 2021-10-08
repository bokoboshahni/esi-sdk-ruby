# frozen_string_literal: true

module ESI
  class Client
    # ESI incursions operations.
    module Incursion
      # Return a list of current incursions.
      #
      # This endpoint is cached for up to 300 seconds.
      #
      # @esi_version dev
      # @esi_version legacy
      # @esi_version v1
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
      # @see https://esi.evetech.net/ui/#/Incursions/get_incursions
      def get_incursions(headers: {}, params: {})
        get("/incursions/", headers: headers, params: params).json
      end
    end
  end
end
