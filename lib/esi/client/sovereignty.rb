# frozen_string_literal: true

module ESI
  class Client
    # ESI sovereignty operations.
    module Sovereignty
      # Shows sovereignty data for campaigns.
      #
      # This endpoint is cached for up to 5 seconds.
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
      # @see https://esi.evetech.net/ui/#/Sovereignty/get_sovereignty_campaigns
      def get_sovereignty_campaigns(headers: {}, params: {})
        get_sovereignty_campaigns_raw(headers: headers, params: params).json
      end

      # Shows sovereignty data for campaigns.
      #
      # This endpoint is cached for up to 5 seconds.
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
      # @see https://esi.evetech.net/ui/#/Sovereignty/get_sovereignty_campaigns
      def get_sovereignty_campaigns_raw(headers: {}, params: {})
        get("/sovereignty/campaigns/", headers: headers, params: params)
      end

      # Shows sovereignty information for solar systems.
      #
      # This endpoint is cached for up to 3600 seconds.
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
      # @see https://esi.evetech.net/ui/#/Sovereignty/get_sovereignty_map
      def get_sovereignty_map(headers: {}, params: {})
        get_sovereignty_map_raw(headers: headers, params: params).json
      end

      # Shows sovereignty information for solar systems.
      #
      # This endpoint is cached for up to 3600 seconds.
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
      # @see https://esi.evetech.net/ui/#/Sovereignty/get_sovereignty_map
      def get_sovereignty_map_raw(headers: {}, params: {})
        get("/sovereignty/map/", headers: headers, params: params)
      end

      # Shows sovereignty data for structures.
      #
      # This endpoint is cached for up to 120 seconds.
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
      # @see https://esi.evetech.net/ui/#/Sovereignty/get_sovereignty_structures
      def get_sovereignty_structures(headers: {}, params: {})
        get_sovereignty_structures_raw(headers: headers, params: params).json
      end

      # Shows sovereignty data for structures.
      #
      # This endpoint is cached for up to 120 seconds.
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
      # @see https://esi.evetech.net/ui/#/Sovereignty/get_sovereignty_structures
      def get_sovereignty_structures_raw(headers: {}, params: {})
        get("/sovereignty/structures/", headers: headers, params: params)
      end
    end
  end
end
