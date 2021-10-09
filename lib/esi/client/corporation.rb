# frozen_string_literal: true

module ESI
  class Client
    # ESI corporation operations.
    module Corporation
      # Public information about a corporation.
      #
      # This endpoint is cached for up to 3600 seconds.
      #
      # @esi_version dev
      # @esi_version v5
      #
      # @param corporation_id [Integer] An EVE corporation ID
      # @param params [Hash] Additional query string parameters
      # @param headers [Hash] Additional headers
      #
      # @raise [ESI::Errors::BadRequestError] Bad request
      # @raise [ESI::Errors::NotFoundError] Corporation not found
      # @raise [ESI::Errors::ErrorLimitedError] Error limited
      # @raise [ESI::Errors::InternalServerError] Internal server error
      # @raise [ESI::Errors::ServiceUnavailableError] Service unavailable
      # @raise [ESI::Errors::GatewayTimeoutError] Gateway timeout
      #
      # @see https://esi.evetech.net/ui/#/Corporation/get_corporations_corporation_id
      def get_corporation(corporation_id:, headers: {}, params: {})
        get_corporation_raw(corporation_id: corporation_id, headers: headers, params: params).json
      end
      alias get_corporations_corporation_id get_corporation

      # Public information about a corporation.
      #
      # This endpoint is cached for up to 3600 seconds.
      #
      # @esi_version dev
      # @esi_version v5
      #
      # @param corporation_id [Integer] An EVE corporation ID
      # @param params [Hash] Additional query string parameters
      # @param headers [Hash] Additional headers
      #
      # @raise [ESI::Errors::BadRequestError] Bad request
      # @raise [ESI::Errors::NotFoundError] Corporation not found
      # @raise [ESI::Errors::ErrorLimitedError] Error limited
      # @raise [ESI::Errors::InternalServerError] Internal server error
      # @raise [ESI::Errors::ServiceUnavailableError] Service unavailable
      # @raise [ESI::Errors::GatewayTimeoutError] Gateway timeout
      #
      # @see https://esi.evetech.net/ui/#/Corporation/get_corporations_corporation_id
      def get_corporation_raw(corporation_id:, headers: {}, params: {})
        get("/corporations/#{corporation_id}/", headers: headers, params: params)
      end

      # Get a list of all the alliances a corporation has been a member of.
      #
      # This endpoint is cached for up to 3600 seconds.
      #
      # @esi_version dev
      # @esi_version v3
      #
      # @param corporation_id [Integer] An EVE corporation ID
      # @param params [Hash] Additional query string parameters
      # @param headers [Hash] Additional headers
      #
      # @raise [ESI::Errors::BadRequestError] Bad request
      # @raise [ESI::Errors::ErrorLimitedError] Error limited
      # @raise [ESI::Errors::InternalServerError] Internal server error
      # @raise [ESI::Errors::ServiceUnavailableError] Service unavailable
      # @raise [ESI::Errors::GatewayTimeoutError] Gateway timeout
      #
      # @see https://esi.evetech.net/ui/#/Corporation/get_corporations_corporation_id_alliancehistory
      def get_corporation_alliancehistory(corporation_id:, headers: {}, params: {})
        get_corporation_alliancehistory_raw(corporation_id: corporation_id, headers: headers, params: params).json
      end
      alias get_corporation_alliance_history get_corporation_alliancehistory
      alias get_corporations_corporation_id_alliancehistory get_corporation_alliancehistory

      # Get a list of all the alliances a corporation has been a member of.
      #
      # This endpoint is cached for up to 3600 seconds.
      #
      # @esi_version dev
      # @esi_version v3
      #
      # @param corporation_id [Integer] An EVE corporation ID
      # @param params [Hash] Additional query string parameters
      # @param headers [Hash] Additional headers
      #
      # @raise [ESI::Errors::BadRequestError] Bad request
      # @raise [ESI::Errors::ErrorLimitedError] Error limited
      # @raise [ESI::Errors::InternalServerError] Internal server error
      # @raise [ESI::Errors::ServiceUnavailableError] Service unavailable
      # @raise [ESI::Errors::GatewayTimeoutError] Gateway timeout
      #
      # @see https://esi.evetech.net/ui/#/Corporation/get_corporations_corporation_id_alliancehistory
      def get_corporation_alliancehistory_raw(corporation_id:, headers: {}, params: {})
        get("/corporations/#{corporation_id}/alliancehistory/", headers: headers, params: params)
      end

      # Returns a list of blueprints the corporation owns.
      #
      # This endpoint is cached for up to 3600 seconds.
      #
      # This endpoint requires authorization (see {ESI::Client#authorize}).
      #
      # @esi_scope esi-corporations.read_blueprints.v1
      #
      # @esi_version dev
      # @esi_version v3
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
      # @see https://esi.evetech.net/ui/#/Corporation/get_corporations_corporation_id_blueprints
      def get_corporation_blueprints(corporation_id:, headers: {}, params: {})
        concat_responses(get_corporation_blueprints_raw(corporation_id: corporation_id, headers: headers, params: params))
      end
      alias get_corporations_corporation_id_blueprints get_corporation_blueprints

      # Returns a list of blueprints the corporation owns.
      #
      # This endpoint is cached for up to 3600 seconds.
      #
      # This endpoint requires authorization (see {ESI::Client#authorize}).
      #
      # @esi_scope esi-corporations.read_blueprints.v1
      #
      # @esi_version dev
      # @esi_version v3
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
      # @see https://esi.evetech.net/ui/#/Corporation/get_corporations_corporation_id_blueprints
      def get_corporation_blueprints_raw(corporation_id:, headers: {}, params: {})
        get("/corporations/#{corporation_id}/blueprints/", headers: headers, params: params)
      end

      # Returns logs recorded in the past seven days from all audit log secure containers (ALSC) owned by a given corporation.
      #
      # This endpoint is cached for up to 600 seconds.
      #
      # This endpoint requires authorization (see {ESI::Client#authorize}).
      #
      # @esi_scope esi-corporations.read_container_logs.v1
      #
      # @esi_version dev
      # @esi_version v3
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
      # @see https://esi.evetech.net/ui/#/Corporation/get_corporations_corporation_id_containers_logs
      def get_corporation_container_logs(corporation_id:, headers: {}, params: {})
        concat_responses(get_corporation_container_logs_raw(corporation_id: corporation_id, headers: headers, params: params))
      end
      alias get_corporations_corporation_id_containers_logs get_corporation_container_logs

      # Returns logs recorded in the past seven days from all audit log secure containers (ALSC) owned by a given corporation.
      #
      # This endpoint is cached for up to 600 seconds.
      #
      # This endpoint requires authorization (see {ESI::Client#authorize}).
      #
      # @esi_scope esi-corporations.read_container_logs.v1
      #
      # @esi_version dev
      # @esi_version v3
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
      # @see https://esi.evetech.net/ui/#/Corporation/get_corporations_corporation_id_containers_logs
      def get_corporation_container_logs_raw(corporation_id:, headers: {}, params: {})
        get("/corporations/#{corporation_id}/containers/logs/", headers: headers, params: params)
      end

      # Return corporation hangar and wallet division names, only show if a division is not using the default name.
      #
      # This endpoint is cached for up to 3600 seconds.
      #
      # This endpoint requires authorization (see {ESI::Client#authorize}).
      #
      # @esi_scope esi-corporations.read_divisions.v1
      #
      # @esi_version dev
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
      # @see https://esi.evetech.net/ui/#/Corporation/get_corporations_corporation_id_divisions
      def get_corporation_divisions(corporation_id:, headers: {}, params: {})
        get_corporation_divisions_raw(corporation_id: corporation_id, headers: headers, params: params).json
      end
      alias get_corporations_corporation_id_divisions get_corporation_divisions

      # Return corporation hangar and wallet division names, only show if a division is not using the default name.
      #
      # This endpoint is cached for up to 3600 seconds.
      #
      # This endpoint requires authorization (see {ESI::Client#authorize}).
      #
      # @esi_scope esi-corporations.read_divisions.v1
      #
      # @esi_version dev
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
      # @see https://esi.evetech.net/ui/#/Corporation/get_corporations_corporation_id_divisions
      def get_corporation_divisions_raw(corporation_id:, headers: {}, params: {})
        get("/corporations/#{corporation_id}/divisions/", headers: headers, params: params)
      end

      # Return a corporation's facilities.
      #
      # This endpoint is cached for up to 3600 seconds.
      #
      # This endpoint requires authorization (see {ESI::Client#authorize}).
      #
      # @esi_scope esi-corporations.read_facilities.v1
      #
      # @esi_version dev
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
      # @see https://esi.evetech.net/ui/#/Corporation/get_corporations_corporation_id_facilities
      def get_corporation_facilities(corporation_id:, headers: {}, params: {})
        get_corporation_facilities_raw(corporation_id: corporation_id, headers: headers, params: params).json
      end
      alias get_corporations_corporation_id_facilities get_corporation_facilities

      # Return a corporation's facilities.
      #
      # This endpoint is cached for up to 3600 seconds.
      #
      # This endpoint requires authorization (see {ESI::Client#authorize}).
      #
      # @esi_scope esi-corporations.read_facilities.v1
      #
      # @esi_version dev
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
      # @see https://esi.evetech.net/ui/#/Corporation/get_corporations_corporation_id_facilities
      def get_corporation_facilities_raw(corporation_id:, headers: {}, params: {})
        get("/corporations/#{corporation_id}/facilities/", headers: headers, params: params)
      end

      # Get the icon urls for a corporation.
      #
      # This endpoint is cached for up to 3600 seconds.
      #
      # @esi_version dev
      # @esi_version v2
      #
      # @param corporation_id [Integer] An EVE corporation ID
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
      # @see https://esi.evetech.net/ui/#/Corporation/get_corporations_corporation_id_icons
      def get_corporation_icons(corporation_id:, headers: {}, params: {})
        get_corporation_icons_raw(corporation_id: corporation_id, headers: headers, params: params).json
      end
      alias get_corporations_corporation_id_icons get_corporation_icons

      # Get the icon urls for a corporation.
      #
      # This endpoint is cached for up to 3600 seconds.
      #
      # @esi_version dev
      # @esi_version v2
      #
      # @param corporation_id [Integer] An EVE corporation ID
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
      # @see https://esi.evetech.net/ui/#/Corporation/get_corporations_corporation_id_icons
      def get_corporation_icons_raw(corporation_id:, headers: {}, params: {})
        get("/corporations/#{corporation_id}/icons/", headers: headers, params: params)
      end

      # Returns a corporation's medals.
      #
      # This endpoint is cached for up to 3600 seconds.
      #
      # This endpoint requires authorization (see {ESI::Client#authorize}).
      #
      # @esi_scope esi-corporations.read_medals.v1
      #
      # @esi_version dev
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
      # @see https://esi.evetech.net/ui/#/Corporation/get_corporations_corporation_id_medals
      def get_corporation_medals(corporation_id:, headers: {}, params: {})
        concat_responses(get_corporation_medals_raw(corporation_id: corporation_id, headers: headers, params: params))
      end
      alias get_corporations_corporation_id_medals get_corporation_medals

      # Returns a corporation's medals.
      #
      # This endpoint is cached for up to 3600 seconds.
      #
      # This endpoint requires authorization (see {ESI::Client#authorize}).
      #
      # @esi_scope esi-corporations.read_medals.v1
      #
      # @esi_version dev
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
      # @see https://esi.evetech.net/ui/#/Corporation/get_corporations_corporation_id_medals
      def get_corporation_medals_raw(corporation_id:, headers: {}, params: {})
        get("/corporations/#{corporation_id}/medals/", headers: headers, params: params)
      end

      # Returns medals issued by a corporation.
      #
      # This endpoint is cached for up to 3600 seconds.
      #
      # This endpoint requires authorization (see {ESI::Client#authorize}).
      #
      # @esi_scope esi-corporations.read_medals.v1
      #
      # @esi_version dev
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
      # @see https://esi.evetech.net/ui/#/Corporation/get_corporations_corporation_id_medals_issued
      def get_corporation_medals_issued(corporation_id:, headers: {}, params: {})
        concat_responses(get_corporation_medals_issued_raw(corporation_id: corporation_id, headers: headers, params: params))
      end
      alias get_corporations_corporation_id_medals_issued get_corporation_medals_issued

      # Returns medals issued by a corporation.
      #
      # This endpoint is cached for up to 3600 seconds.
      #
      # This endpoint requires authorization (see {ESI::Client#authorize}).
      #
      # @esi_scope esi-corporations.read_medals.v1
      #
      # @esi_version dev
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
      # @see https://esi.evetech.net/ui/#/Corporation/get_corporations_corporation_id_medals_issued
      def get_corporation_medals_issued_raw(corporation_id:, headers: {}, params: {})
        get("/corporations/#{corporation_id}/medals/issued/", headers: headers, params: params)
      end

      # Returns a corporation's members' titles.
      #
      # This endpoint is cached for up to 3600 seconds.
      #
      # This endpoint requires authorization (see {ESI::Client#authorize}).
      #
      # @esi_scope esi-corporations.read_titles.v1
      #
      # @esi_version dev
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
      # @see https://esi.evetech.net/ui/#/Corporation/get_corporations_corporation_id_members_titles
      def get_corporation_member_titles(corporation_id:, headers: {}, params: {})
        get_corporation_member_titles_raw(corporation_id: corporation_id, headers: headers, params: params).json
      end
      alias get_corporations_corporation_id_members_titles get_corporation_member_titles

      # Returns a corporation's members' titles.
      #
      # This endpoint is cached for up to 3600 seconds.
      #
      # This endpoint requires authorization (see {ESI::Client#authorize}).
      #
      # @esi_scope esi-corporations.read_titles.v1
      #
      # @esi_version dev
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
      # @see https://esi.evetech.net/ui/#/Corporation/get_corporations_corporation_id_members_titles
      def get_corporation_member_titles_raw(corporation_id:, headers: {}, params: {})
        get("/corporations/#{corporation_id}/members/titles/", headers: headers, params: params)
      end

      # Return the current member list of a corporation, the token's character need to be a member of the corporation.
      #
      # This endpoint is cached for up to 3600 seconds.
      #
      # This endpoint requires authorization (see {ESI::Client#authorize}).
      #
      # @esi_scope esi-corporations.read_corporation_membership.v1
      #
      # @esi_version dev
      # @esi_version v4
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
      # @see https://esi.evetech.net/ui/#/Corporation/get_corporations_corporation_id_members
      def get_corporation_members(corporation_id:, headers: {}, params: {})
        get_corporation_members_raw(corporation_id: corporation_id, headers: headers, params: params).json
      end
      alias get_corporations_corporation_id_members get_corporation_members

      # Return the current member list of a corporation, the token's character need to be a member of the corporation.
      #
      # This endpoint is cached for up to 3600 seconds.
      #
      # This endpoint requires authorization (see {ESI::Client#authorize}).
      #
      # @esi_scope esi-corporations.read_corporation_membership.v1
      #
      # @esi_version dev
      # @esi_version v4
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
      # @see https://esi.evetech.net/ui/#/Corporation/get_corporations_corporation_id_members
      def get_corporation_members_raw(corporation_id:, headers: {}, params: {})
        get("/corporations/#{corporation_id}/members/", headers: headers, params: params)
      end

      # Return a corporation's member limit, not including CEO himself.
      #
      # This endpoint is cached for up to 3600 seconds.
      #
      # This endpoint requires authorization (see {ESI::Client#authorize}).
      #
      # @esi_scope esi-corporations.track_members.v1
      #
      # @esi_version dev
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
      # @see https://esi.evetech.net/ui/#/Corporation/get_corporations_corporation_id_members_limit
      def get_corporation_members_limit(corporation_id:, headers: {}, params: {})
        get_corporation_members_limit_raw(corporation_id: corporation_id, headers: headers, params: params).json
      end
      alias get_corporations_corporation_id_members_limit get_corporation_members_limit

      # Return a corporation's member limit, not including CEO himself.
      #
      # This endpoint is cached for up to 3600 seconds.
      #
      # This endpoint requires authorization (see {ESI::Client#authorize}).
      #
      # @esi_scope esi-corporations.track_members.v1
      #
      # @esi_version dev
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
      # @see https://esi.evetech.net/ui/#/Corporation/get_corporations_corporation_id_members_limit
      def get_corporation_members_limit_raw(corporation_id:, headers: {}, params: {})
        get("/corporations/#{corporation_id}/members/limit/", headers: headers, params: params)
      end

      # Returns additional information about a corporation's members which helps tracking their activities.
      #
      # This endpoint is cached for up to 3600 seconds.
      #
      # This endpoint requires authorization (see {ESI::Client#authorize}).
      #
      # @esi_scope esi-corporations.track_members.v1
      #
      # @esi_version dev
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
      # @see https://esi.evetech.net/ui/#/Corporation/get_corporations_corporation_id_membertracking
      def get_corporation_membertracking(corporation_id:, headers: {}, params: {})
        get_corporation_membertracking_raw(corporation_id: corporation_id, headers: headers, params: params).json
      end
      alias get_corporations_corporation_id_membertracking get_corporation_membertracking

      # Returns additional information about a corporation's members which helps tracking their activities.
      #
      # This endpoint is cached for up to 3600 seconds.
      #
      # This endpoint requires authorization (see {ESI::Client#authorize}).
      #
      # @esi_scope esi-corporations.track_members.v1
      #
      # @esi_version dev
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
      # @see https://esi.evetech.net/ui/#/Corporation/get_corporations_corporation_id_membertracking
      def get_corporation_membertracking_raw(corporation_id:, headers: {}, params: {})
        get("/corporations/#{corporation_id}/membertracking/", headers: headers, params: params)
      end

      # Get a list of npc corporations.
      #
      # @esi_version dev
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
      # @see https://esi.evetech.net/ui/#/Corporation/get_corporations_npccorps
      def get_corporation_npccorps(headers: {}, params: {})
        get_corporation_npccorps_raw(headers: headers, params: params).json
      end
      alias get_corporations_npccorps get_corporation_npccorps

      # Get a list of npc corporations.
      #
      # @esi_version dev
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
      # @see https://esi.evetech.net/ui/#/Corporation/get_corporations_npccorps
      def get_corporation_npccorps_raw(headers: {}, params: {})
        get("/corporations/npccorps/", headers: headers, params: params)
      end

      # Return the roles of all members if the character has the personnel manager role or any grantable role.
      #
      # This endpoint is cached for up to 3600 seconds.
      #
      # This endpoint requires authorization (see {ESI::Client#authorize}).
      #
      # @esi_scope esi-corporations.read_corporation_membership.v1
      #
      # @esi_version dev
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
      # @see https://esi.evetech.net/ui/#/Corporation/get_corporations_corporation_id_roles
      def get_corporation_roles(corporation_id:, headers: {}, params: {})
        get_corporation_roles_raw(corporation_id: corporation_id, headers: headers, params: params).json
      end
      alias get_corporations_corporation_id_roles get_corporation_roles

      # Return the roles of all members if the character has the personnel manager role or any grantable role.
      #
      # This endpoint is cached for up to 3600 seconds.
      #
      # This endpoint requires authorization (see {ESI::Client#authorize}).
      #
      # @esi_scope esi-corporations.read_corporation_membership.v1
      #
      # @esi_version dev
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
      # @see https://esi.evetech.net/ui/#/Corporation/get_corporations_corporation_id_roles
      def get_corporation_roles_raw(corporation_id:, headers: {}, params: {})
        get("/corporations/#{corporation_id}/roles/", headers: headers, params: params)
      end

      # Return how roles have changed for a coporation's members, up to a month.
      #
      # This endpoint is cached for up to 3600 seconds.
      #
      # This endpoint requires authorization (see {ESI::Client#authorize}).
      #
      # @esi_scope esi-corporations.read_corporation_membership.v1
      #
      # @esi_version dev
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
      # @see https://esi.evetech.net/ui/#/Corporation/get_corporations_corporation_id_roles_history
      def get_corporation_roles_history(corporation_id:, headers: {}, params: {})
        concat_responses(get_corporation_roles_history_raw(corporation_id: corporation_id, headers: headers, params: params))
      end
      alias get_corporations_corporation_id_roles_history get_corporation_roles_history

      # Return how roles have changed for a coporation's members, up to a month.
      #
      # This endpoint is cached for up to 3600 seconds.
      #
      # This endpoint requires authorization (see {ESI::Client#authorize}).
      #
      # @esi_scope esi-corporations.read_corporation_membership.v1
      #
      # @esi_version dev
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
      # @see https://esi.evetech.net/ui/#/Corporation/get_corporations_corporation_id_roles_history
      def get_corporation_roles_history_raw(corporation_id:, headers: {}, params: {})
        get("/corporations/#{corporation_id}/roles/history/", headers: headers, params: params)
      end

      # Return the current shareholders of a corporation.
      #
      # This endpoint is cached for up to 3600 seconds.
      #
      # This endpoint requires authorization (see {ESI::Client#authorize}).
      #
      # @esi_scope esi-wallet.read_corporation_wallets.v1
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
      # @see https://esi.evetech.net/ui/#/Corporation/get_corporations_corporation_id_shareholders
      def get_corporation_shareholders(corporation_id:, headers: {}, params: {})
        concat_responses(get_corporation_shareholders_raw(corporation_id: corporation_id, headers: headers, params: params))
      end
      alias get_corporations_corporation_id_shareholders get_corporation_shareholders

      # Return the current shareholders of a corporation.
      #
      # This endpoint is cached for up to 3600 seconds.
      #
      # This endpoint requires authorization (see {ESI::Client#authorize}).
      #
      # @esi_scope esi-wallet.read_corporation_wallets.v1
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
      # @see https://esi.evetech.net/ui/#/Corporation/get_corporations_corporation_id_shareholders
      def get_corporation_shareholders_raw(corporation_id:, headers: {}, params: {})
        get("/corporations/#{corporation_id}/shareholders/", headers: headers, params: params)
      end

      # Return corporation standings from agents, NPC corporations, and factions.
      #
      # This endpoint is cached for up to 3600 seconds.
      #
      # This endpoint requires authorization (see {ESI::Client#authorize}).
      #
      # @esi_scope esi-corporations.read_standings.v1
      #
      # @esi_version dev
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
      # @see https://esi.evetech.net/ui/#/Corporation/get_corporations_corporation_id_standings
      def get_corporation_standings(corporation_id:, headers: {}, params: {})
        concat_responses(get_corporation_standings_raw(corporation_id: corporation_id, headers: headers, params: params))
      end
      alias get_corporations_corporation_id_standings get_corporation_standings

      # Return corporation standings from agents, NPC corporations, and factions.
      #
      # This endpoint is cached for up to 3600 seconds.
      #
      # This endpoint requires authorization (see {ESI::Client#authorize}).
      #
      # @esi_scope esi-corporations.read_standings.v1
      #
      # @esi_version dev
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
      # @see https://esi.evetech.net/ui/#/Corporation/get_corporations_corporation_id_standings
      def get_corporation_standings_raw(corporation_id:, headers: {}, params: {})
        get("/corporations/#{corporation_id}/standings/", headers: headers, params: params)
      end

      # Returns various settings and fuels of a starbase (POS).
      #
      # This endpoint is cached for up to 3600 seconds.
      #
      # This endpoint requires authorization (see {ESI::Client#authorize}).
      #
      # @esi_scope esi-corporations.read_starbases.v1
      #
      # @esi_version dev
      # @esi_version v2
      #
      # @param corporation_id [Integer] An EVE corporation ID
      # @param starbase_id [Integer] An EVE starbase (POS) ID
      # @param system_id [Integer] The solar system this starbase (POS) is located in,
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
      # @see https://esi.evetech.net/ui/#/Corporation/get_corporations_corporation_id_starbases_starbase_id
      def get_corporation_starbase(corporation_id:, starbase_id:, system_id:, headers: {}, params: {})
        get_corporation_starbase_raw(corporation_id: corporation_id, starbase_id: starbase_id, system_id: system_id, headers: headers, params: params).json
      end
      alias get_corporations_corporation_id_starbases_starbase_id get_corporation_starbase

      # Returns various settings and fuels of a starbase (POS).
      #
      # This endpoint is cached for up to 3600 seconds.
      #
      # This endpoint requires authorization (see {ESI::Client#authorize}).
      #
      # @esi_scope esi-corporations.read_starbases.v1
      #
      # @esi_version dev
      # @esi_version v2
      #
      # @param corporation_id [Integer] An EVE corporation ID
      # @param starbase_id [Integer] An EVE starbase (POS) ID
      # @param system_id [Integer] The solar system this starbase (POS) is located in,
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
      # @see https://esi.evetech.net/ui/#/Corporation/get_corporations_corporation_id_starbases_starbase_id
      def get_corporation_starbase_raw(corporation_id:, starbase_id:, system_id:, headers: {}, params: {})
        params.merge!("system_id" => system_id)
        get("/corporations/#{corporation_id}/starbases/#{starbase_id}/", headers: headers, params: params)
      end

      # Returns list of corporation starbases (POSes).
      #
      # This endpoint is cached for up to 3600 seconds.
      #
      # This endpoint requires authorization (see {ESI::Client#authorize}).
      #
      # @esi_scope esi-corporations.read_starbases.v1
      #
      # @esi_version dev
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
      # @see https://esi.evetech.net/ui/#/Corporation/get_corporations_corporation_id_starbases
      def get_corporation_starbases(corporation_id:, headers: {}, params: {})
        concat_responses(get_corporation_starbases_raw(corporation_id: corporation_id, headers: headers, params: params))
      end
      alias get_corporations_corporation_id_starbases get_corporation_starbases

      # Returns list of corporation starbases (POSes).
      #
      # This endpoint is cached for up to 3600 seconds.
      #
      # This endpoint requires authorization (see {ESI::Client#authorize}).
      #
      # @esi_scope esi-corporations.read_starbases.v1
      #
      # @esi_version dev
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
      # @see https://esi.evetech.net/ui/#/Corporation/get_corporations_corporation_id_starbases
      def get_corporation_starbases_raw(corporation_id:, headers: {}, params: {})
        get("/corporations/#{corporation_id}/starbases/", headers: headers, params: params)
      end

      # Get a list of corporation structures. This route's version includes the changes to structures detailed in this blog: https://www.eveonline.com/article/upwell-2.0-structures-changes-coming-on-february-13th.
      #
      # This endpoint is cached for up to 3600 seconds.
      #
      # This endpoint requires authorization (see {ESI::Client#authorize}).
      #
      # @esi_scope esi-corporations.read_structures.v1
      #
      # @esi_version dev
      # @esi_version v4
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
      # @see https://esi.evetech.net/ui/#/Corporation/get_corporations_corporation_id_structures
      def get_corporation_structures(corporation_id:, headers: {}, params: {})
        concat_responses(get_corporation_structures_raw(corporation_id: corporation_id, headers: headers, params: params))
      end
      alias get_corporations_corporation_id_structures get_corporation_structures

      # Get a list of corporation structures. This route's version includes the changes to structures detailed in this blog: https://www.eveonline.com/article/upwell-2.0-structures-changes-coming-on-february-13th.
      #
      # This endpoint is cached for up to 3600 seconds.
      #
      # This endpoint requires authorization (see {ESI::Client#authorize}).
      #
      # @esi_scope esi-corporations.read_structures.v1
      #
      # @esi_version dev
      # @esi_version v4
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
      # @see https://esi.evetech.net/ui/#/Corporation/get_corporations_corporation_id_structures
      def get_corporation_structures_raw(corporation_id:, headers: {}, params: {})
        get("/corporations/#{corporation_id}/structures/", headers: headers, params: params)
      end

      # Returns a corporation's titles.
      #
      # This endpoint is cached for up to 3600 seconds.
      #
      # This endpoint requires authorization (see {ESI::Client#authorize}).
      #
      # @esi_scope esi-corporations.read_titles.v1
      #
      # @esi_version dev
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
      # @see https://esi.evetech.net/ui/#/Corporation/get_corporations_corporation_id_titles
      def get_corporation_titles(corporation_id:, headers: {}, params: {})
        get_corporation_titles_raw(corporation_id: corporation_id, headers: headers, params: params).json
      end
      alias get_corporations_corporation_id_titles get_corporation_titles

      # Returns a corporation's titles.
      #
      # This endpoint is cached for up to 3600 seconds.
      #
      # This endpoint requires authorization (see {ESI::Client#authorize}).
      #
      # @esi_scope esi-corporations.read_titles.v1
      #
      # @esi_version dev
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
      # @see https://esi.evetech.net/ui/#/Corporation/get_corporations_corporation_id_titles
      def get_corporation_titles_raw(corporation_id:, headers: {}, params: {})
        get("/corporations/#{corporation_id}/titles/", headers: headers, params: params)
      end
    end
  end
end
