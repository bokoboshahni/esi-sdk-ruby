# frozen_string_literal: true

module ESI
  class Client
    # ESI killmails operations.
    module Killmail
      # Return a list of a character's kills and losses going back 90 days.
      #
      # This endpoint is cached for up to 300 seconds.
      #
      # This endpoint requires authorization (see {ESI::Client#authorize}).
      #
      # @esi_scope esi-killmails.read_killmails.v1
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
      # @see https://esi.evetech.net/ui/#/Killmails/get_characters_character_id_killmails_recent
      def get_character_killmails_recent(character_id:, headers: {}, params: {})
        concat_responses(get_character_killmails_recent_raw(character_id: character_id, headers: headers, params: params))
      end
      alias get_characters_character_id_killmails_recent get_character_killmails_recent

      # Return a list of a character's kills and losses going back 90 days.
      #
      # This endpoint is cached for up to 300 seconds.
      #
      # This endpoint requires authorization (see {ESI::Client#authorize}).
      #
      # @esi_scope esi-killmails.read_killmails.v1
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
      # @see https://esi.evetech.net/ui/#/Killmails/get_characters_character_id_killmails_recent
      def get_character_killmails_recent_raw(character_id:, headers: {}, params: {})
        get("/characters/#{character_id}/killmails/recent/", headers: headers, params: params)
      end

      # Get a list of a corporation's kills and losses going back 90 days.
      #
      # This endpoint is cached for up to 300 seconds.
      #
      # This endpoint requires authorization (see {ESI::Client#authorize}).
      #
      # @esi_scope esi-killmails.read_corporation_killmails.v1
      #
      # @esi_version dev
      # @esi_version legacy
      # @esi_version v1
      #
      # @param corporation_id [Integer] An EVE corporation ID
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
      # @see https://esi.evetech.net/ui/#/Killmails/get_corporations_corporation_id_killmails_recent
      def get_corporation_killmails_recent(corporation_id:, headers: {}, params: {})
        concat_responses(get_corporation_killmails_recent_raw(corporation_id: corporation_id, headers: headers, params: params))
      end
      alias get_corporations_corporation_id_killmails_recent get_corporation_killmails_recent

      # Get a list of a corporation's kills and losses going back 90 days.
      #
      # This endpoint is cached for up to 300 seconds.
      #
      # This endpoint requires authorization (see {ESI::Client#authorize}).
      #
      # @esi_scope esi-killmails.read_corporation_killmails.v1
      #
      # @esi_version dev
      # @esi_version legacy
      # @esi_version v1
      #
      # @param corporation_id [Integer] An EVE corporation ID
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
      # @see https://esi.evetech.net/ui/#/Killmails/get_corporations_corporation_id_killmails_recent
      def get_corporation_killmails_recent_raw(corporation_id:, headers: {}, params: {})
        get("/corporations/#{corporation_id}/killmails/recent/", headers: headers, params: params)
      end

      # Return a single killmail from its ID and hash.
      #
      # This endpoint is cached for up to 30758400 seconds.
      #
      # @esi_version dev
      # @esi_version legacy
      # @esi_version v1
      #
      # @param killmail_hash [String] The killmail hash for verification
      # @param killmail_id [Integer] The killmail ID to be queried
      # @param params [Hash] Additional query string parameters
      # @param headers [Hash] Additional headers
      #
      # @raise [ESI::Errors::BadRequestError] Bad request
      # @raise [ESI::Errors::ErrorLimitedError] Error limited
      # @raise [ESI::Errors::UnprocessableEntityError] Invalid killmail_id and/or killmail_hash
      # @raise [ESI::Errors::InternalServerError] Internal server error
      # @raise [ESI::Errors::ServiceUnavailableError] Service unavailable
      # @raise [ESI::Errors::GatewayTimeoutError] Gateway timeout
      #
      # @see https://esi.evetech.net/ui/#/Killmails/get_killmails_killmail_id_killmail_hash
      def get_killmail_killmail_hash(killmail_hash:, killmail_id:, headers: {}, params: {})
        get_killmail_killmail_hash_raw(killmail_hash: killmail_hash, killmail_id: killmail_id, headers: headers, params: params).json
      end
      alias get_killmail get_killmail_killmail_hash
      alias get_killmails_killmail_id_killmail_hash get_killmail_killmail_hash

      # Return a single killmail from its ID and hash.
      #
      # This endpoint is cached for up to 30758400 seconds.
      #
      # @esi_version dev
      # @esi_version legacy
      # @esi_version v1
      #
      # @param killmail_hash [String] The killmail hash for verification
      # @param killmail_id [Integer] The killmail ID to be queried
      # @param params [Hash] Additional query string parameters
      # @param headers [Hash] Additional headers
      #
      # @raise [ESI::Errors::BadRequestError] Bad request
      # @raise [ESI::Errors::ErrorLimitedError] Error limited
      # @raise [ESI::Errors::UnprocessableEntityError] Invalid killmail_id and/or killmail_hash
      # @raise [ESI::Errors::InternalServerError] Internal server error
      # @raise [ESI::Errors::ServiceUnavailableError] Service unavailable
      # @raise [ESI::Errors::GatewayTimeoutError] Gateway timeout
      #
      # @see https://esi.evetech.net/ui/#/Killmails/get_killmails_killmail_id_killmail_hash
      def get_killmail_killmail_hash_raw(killmail_hash:, killmail_id:, headers: {}, params: {})
        get("/killmails/#{killmail_id}/#{killmail_hash}/", headers: headers, params: params)
      end
    end
  end
end
