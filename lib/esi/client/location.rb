# frozen_string_literal: true

module ESI
  class Client
    # ESI location operations.
    module Location
      # Information about the characters current location. Returns the current solar system id, and also the current station or structure ID if applicable.
      #
      # This endpoint is cached for up to 5 seconds.
      #
      # This endpoint requires authorization (see {ESI::Client#authorize}).
      #
      # @esi_scope esi-location.read_location.v1
      #
      # @esi_version dev
      # @esi_version legacy
      # @esi_version v1
      # @esi_version v2
      #
      # @param character_id [Integer] An EVE character ID
      # @param params [Hash] Additional query string parameters
      # @param headers [Hash] Additional headers
      #
      # @raise [ESI::Errors::BadRequestError] Bad request
      # @raise [ESI::Errors::UnauthorizedError] Unauthorized
      # @raise [ESI::Errors::ForbiddenError] Forbidden
      # @raise [ESI::Errors::ErrorLimitedError] Error limited
      # @raise [ESI::Errors::InternalServerError] Internal server error
      # @raise [ESI::Errors::ServiceUnavailableError] Service unavailable
      # @raise [ESI::Errors::GatewayTimeoutError] Gateway timeout
      #
      # @see https://esi.evetech.net/ui/#/Location/get_characters_character_id_location
      def get_character_location(character_id:, headers: {}, params: {})
        get("/characters/#{character_id}/location/", headers: headers, params: params)
      end
      alias get_characters_character_id_location get_character_location

      # Checks if the character is currently online.
      #
      # This endpoint is cached for up to 60 seconds.
      #
      # This endpoint requires authorization (see {ESI::Client#authorize}).
      #
      # @esi_scope esi-location.read_online.v1
      #
      # @esi_version dev
      # @esi_version v2
      # @esi_version v3
      #
      # @param character_id [Integer] An EVE character ID
      # @param params [Hash] Additional query string parameters
      # @param headers [Hash] Additional headers
      #
      # @raise [ESI::Errors::BadRequestError] Bad request
      # @raise [ESI::Errors::UnauthorizedError] Unauthorized
      # @raise [ESI::Errors::ForbiddenError] Forbidden
      # @raise [ESI::Errors::ErrorLimitedError] Error limited
      # @raise [ESI::Errors::InternalServerError] Internal server error
      # @raise [ESI::Errors::ServiceUnavailableError] Service unavailable
      # @raise [ESI::Errors::GatewayTimeoutError] Gateway timeout
      #
      # @see https://esi.evetech.net/ui/#/Location/get_characters_character_id_online
      def get_character_online(character_id:, headers: {}, params: {})
        get("/characters/#{character_id}/online/", headers: headers, params: params)
      end
      alias get_characters_character_id_online get_character_online

      # Get the current ship type, name and id.
      #
      # This endpoint is cached for up to 5 seconds.
      #
      # This endpoint requires authorization (see {ESI::Client#authorize}).
      #
      # @esi_scope esi-location.read_ship_type.v1
      #
      # @esi_version dev
      # @esi_version legacy
      # @esi_version v1
      # @esi_version v2
      #
      # @param character_id [Integer] An EVE character ID
      # @param params [Hash] Additional query string parameters
      # @param headers [Hash] Additional headers
      #
      # @raise [ESI::Errors::BadRequestError] Bad request
      # @raise [ESI::Errors::UnauthorizedError] Unauthorized
      # @raise [ESI::Errors::ForbiddenError] Forbidden
      # @raise [ESI::Errors::ErrorLimitedError] Error limited
      # @raise [ESI::Errors::InternalServerError] Internal server error
      # @raise [ESI::Errors::ServiceUnavailableError] Service unavailable
      # @raise [ESI::Errors::GatewayTimeoutError] Gateway timeout
      #
      # @see https://esi.evetech.net/ui/#/Location/get_characters_character_id_ship
      def get_character_ship(character_id:, headers: {}, params: {})
        get("/characters/#{character_id}/ship/", headers: headers, params: params)
      end
      alias get_characters_character_id_ship get_character_ship
    end
  end
end
