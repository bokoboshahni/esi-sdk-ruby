# frozen_string_literal: true

module ESI
  class Client
    # ESI faction warfare operations.
    module FactionWarfare
      # Statistical overview of a character involved in faction warfare.
      #
      # This endpoint requires authorization (see {ESI::Client#authorize}).
      #
      # @esi_scope esi-characters.read_fw_stats.v1
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
      # @see https://esi.evetech.net/ui/#/Faction Warfare/get_characters_character_id_fw_stats
      def get_character_fw_stats(character_id:, headers: {}, params: {})
        get("/characters/#{character_id}/fw/stats/", headers: headers, params: params).json
      end
      alias get_characters_character_id_fw_stats get_character_fw_stats

      # Statistics about a corporation involved in faction warfare.
      #
      # This endpoint requires authorization (see {ESI::Client#authorize}).
      #
      # @esi_scope esi-corporations.read_fw_stats.v1
      #
      # @esi_version dev
      # @esi_version legacy
      # @esi_version v1
      # @esi_version v2
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
      # @see https://esi.evetech.net/ui/#/Faction Warfare/get_corporations_corporation_id_fw_stats
      def get_corporation_fw_stats(corporation_id:, headers: {}, params: {})
        get("/corporations/#{corporation_id}/fw/stats/", headers: headers, params: params).json
      end
      alias get_corporations_corporation_id_fw_stats get_corporation_fw_stats

      # Top 100 leaderboard of pilots for kills and victory points separated by total, last week and yesterday.
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
      # @see https://esi.evetech.net/ui/#/Faction Warfare/get_fw_leaderboards_characters
      def get_fw_leaderboard_characters(headers: {}, params: {})
        get("/fw/leaderboards/characters/", headers: headers, params: params).json
      end
      alias get_fw_leaderboards_characters get_fw_leaderboard_characters

      # Top 10 leaderboard of corporations for kills and victory points separated by total, last week and yesterday.
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
      # @see https://esi.evetech.net/ui/#/Faction Warfare/get_fw_leaderboards_corporations
      def get_fw_leaderboard_corporations(headers: {}, params: {})
        get("/fw/leaderboards/corporations/", headers: headers, params: params).json
      end
      alias get_fw_leaderboards_corporations get_fw_leaderboard_corporations

      # Top 4 leaderboard of factions for kills and victory points separated by total, last week and yesterday.
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
      # @see https://esi.evetech.net/ui/#/Faction Warfare/get_fw_leaderboards
      def get_fw_leaderboards(headers: {}, params: {})
        get("/fw/leaderboards/", headers: headers, params: params).json
      end

      # Statistical overviews of factions involved in faction warfare.
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
      # @see https://esi.evetech.net/ui/#/Faction Warfare/get_fw_stats
      def get_fw_stats(headers: {}, params: {})
        get("/fw/stats/", headers: headers, params: params).json
      end

      # An overview of the current ownership of faction warfare solar systems.
      #
      # This endpoint is cached for up to 1800 seconds.
      #
      # @esi_version dev
      # @esi_version legacy
      # @esi_version v2
      # @esi_version v3
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
      # @see https://esi.evetech.net/ui/#/Faction Warfare/get_fw_systems
      def get_fw_systems(headers: {}, params: {})
        get("/fw/systems/", headers: headers, params: params).json
      end

      # Data about which NPC factions are at war.
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
      # @see https://esi.evetech.net/ui/#/Faction Warfare/get_fw_wars
      def get_fw_wars(headers: {}, params: {})
        get("/fw/wars/", headers: headers, params: params).json
      end
    end
  end
end
