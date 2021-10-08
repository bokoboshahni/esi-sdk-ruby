# frozen_string_literal: true

module ESI
  class Client
    # ESI skills operations.
    module Skill
      # Return attributes of a character.
      #
      # This endpoint is cached for up to 120 seconds.
      #
      # This endpoint requires authorization (see {ESI::Client#authorize}).
      #
      # @esi_scope esi-skills.read_skills.v1
      #
      # @esi_version dev
      # @esi_version legacy
      # @esi_version v1
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
      # @see https://esi.evetech.net/ui/#/Skills/get_characters_character_id_attributes
      def get_character_attributes(character_id:, headers: {}, params: {})
        get("/characters/#{character_id}/attributes/", headers: headers, params: params).json
      end
      alias get_characters_character_id_attributes get_character_attributes

      # List the configured skill queue for the given character.
      #
      # This endpoint is cached for up to 120 seconds.
      #
      # This endpoint requires authorization (see {ESI::Client#authorize}).
      #
      # @esi_scope esi-skills.read_skillqueue.v1
      #
      # @esi_version dev
      # @esi_version legacy
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
      # @see https://esi.evetech.net/ui/#/Skills/get_characters_character_id_skillqueue
      def get_character_skillqueue(character_id:, headers: {}, params: {})
        get("/characters/#{character_id}/skillqueue/", headers: headers, params: params).json
      end
      alias get_characters_character_id_skillqueue get_character_skillqueue

      # List all trained skills for the given character.
      #
      # This endpoint is cached for up to 120 seconds.
      #
      # This endpoint requires authorization (see {ESI::Client#authorize}).
      #
      # @esi_scope esi-skills.read_skills.v1
      #
      # @esi_version dev
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
      # @see https://esi.evetech.net/ui/#/Skills/get_characters_character_id_skills
      def get_character_skills(character_id:, headers: {}, params: {})
        get("/characters/#{character_id}/skills/", headers: headers, params: params).json
      end
      alias get_characters_character_id_skills get_character_skills
    end
  end
end
