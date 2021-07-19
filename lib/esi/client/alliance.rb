# frozen_string_literal: true

module ESI
  class Client
    # ESI alliance operations.
    module Alliance
      # Public information about an alliance.
      #
      # This endpoint is cached for up to 3600 seconds.
      #
      # @esi_version dev
      # @esi_version legacy
      # @esi_version v3
      # @esi_version v4
      #
      # @param alliance_id [Integer,String] An EVE alliance ID
      # @param params [Hash] Additional query string parameters
      # @param headers [Hash] Additional headers
      #
      # @raise [ESI::Errors::BadRequestError] Bad request
      # @raise [ESI::Errors::NotFoundError] Alliance not found
      # @raise [ESI::Errors::ErrorLimitedError] Error limited
      # @raise [ESI::Errors::InternalServerError] Internal server error
      # @raise [ESI::Errors::ServiceUnavailableError] Service unavailable
      # @raise [ESI::Errors::GatewayTimeoutError] Gateway timeout
      #
      # @see https://esi.evetech.net/ui/#/Alliance/get_alliances_alliance_id
      def get_alliance(alliance_id:, params: {}, headers: {})
        get("/alliances/#{alliance_id}/", headers: headers, params: params)
      end
      alias get_alliances_alliance_id get_alliance

      # List all current member corporations of an alliance.
      #
      # This endpoint is cached for up to 3600 seconds.
      #
      # @esi_version dev
      # @esi_version legacy
      # @esi_version v1
      # @esi_version v2
      #
      # @param alliance_id [Integer,String] An EVE alliance ID
      # @param params [Hash] Additional query string parameters
      # @param headers [Hash] Additional headers
      #
      # @raise [ESI::Errors::BadRequestError] Bad request
      # @raise [ESI::Errors::ErrorLimitedError] Error limited
      # @raise [ESI::Errors::InternalServerError] Internal server error
      # @raise [ESI::Errors::ServiceUnavailableError] Service unavailable
      # @raise [ESI::Errors::GatewayTimeoutError] Gateway timeout
      #
      # @see https://esi.evetech.net/ui/#/Alliance/get_alliances_alliance_id_corporations
      def get_alliance_corporations(alliance_id:, params: {}, headers: {})
        get("/alliances/#{alliance_id}/corporations/", headers: headers, params: params)
      end
      alias get_alliances_alliance_id_corporations get_alliance_corporations

      # Get the icon urls for a alliance.
      #
      # @esi_version legacy
      # @esi_version v1
      #
      # @param alliance_id [Integer,String] An EVE alliance ID
      # @param params [Hash] Additional query string parameters
      # @param headers [Hash] Additional headers
      #
      # @raise [ESI::Errors::BadRequestError] Bad request
      # @raise [ESI::Errors::NotFoundError] No image server for this datasource
      # @raise [ESI::Errors::ErrorLimitedError] Error limited
      # @raise [ESI::Errors::InternalServerError] Internal server error
      # @raise [ESI::Errors::ServiceUnavailableError] Service unavailable
      # @raise [ESI::Errors::GatewayTimeoutError] Gateway timeout
      #
      # @see https://esi.evetech.net/ui/#/Alliance/get_alliances_alliance_id_icons
      def get_alliance_icons(alliance_id:, params: {}, headers: {})
        get("/alliances/#{alliance_id}/icons/", headers: headers, params: params)
      end
      alias get_alliances_alliance_id_icons get_alliance_icons

      # List all active player alliances.
      #
      # This endpoint is cached for up to 3600 seconds.
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
      # @see https://esi.evetech.net/ui/#/Alliance/get_alliances
      def get_alliances(params: {}, headers: {})
        get("/alliances/", headers: headers, params: params)
      end
    end
  end
end
