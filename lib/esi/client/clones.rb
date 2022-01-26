# frozen_string_literal: true

module ESI
  class Client
    # ESI clones operations.
    module Clone
      # A list of the character's clones.
      #
      # This endpoint is cached for up to 120 seconds.
      #
      # This endpoint requires authorization (see {ESI::Client#authorize}).
      #
      # @esi_scope esi-clones.read_clones.v1
      #
      # @esi_version dev
      # @esi_version v3
      # @esi_version v4
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
      # @see https://esi.evetech.net/ui/#/Clones/get_characters_character_id_clones
      def get_character_clones(character_id:, headers: {}, params: {})
        parse_response(get_character_clones_raw(character_id: character_id, headers: headers, params: params))
      end
      alias get_characters_character_id_clones get_character_clones

      # A list of the character's clones.
      #
      # This endpoint is cached for up to 120 seconds.
      #
      # This endpoint requires authorization (see {ESI::Client#authorize}).
      #
      # @esi_scope esi-clones.read_clones.v1
      #
      # @esi_version dev
      # @esi_version v3
      # @esi_version v4
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
      # @see https://esi.evetech.net/ui/#/Clones/get_characters_character_id_clones
      def get_character_clones_raw(character_id:, headers: {}, params: {})
        get("/characters/#{character_id}/clones/", headers: headers, params: params)
      end

      # Return implants on the active clone of a character.
      #
      # This endpoint is cached for up to 120 seconds.
      #
      # This endpoint requires authorization (see {ESI::Client#authorize}).
      #
      # @esi_scope esi-clones.read_implants.v1
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
      # @see https://esi.evetech.net/ui/#/Clones/get_characters_character_id_implants
      def get_character_implants(character_id:, headers: {}, params: {})
        parse_response(get_character_implants_raw(character_id: character_id, headers: headers, params: params))
      end
      alias get_characters_character_id_implants get_character_implants

      # Return implants on the active clone of a character.
      #
      # This endpoint is cached for up to 120 seconds.
      #
      # This endpoint requires authorization (see {ESI::Client#authorize}).
      #
      # @esi_scope esi-clones.read_implants.v1
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
      # @see https://esi.evetech.net/ui/#/Clones/get_characters_character_id_implants
      def get_character_implants_raw(character_id:, headers: {}, params: {})
        get("/characters/#{character_id}/implants/", headers: headers, params: params)
      end
    end
  end
end
