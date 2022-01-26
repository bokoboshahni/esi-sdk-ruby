# frozen_string_literal: true

module ESI
  class Client
    # ESI character operations.
    module Character
      # Public information about a character.
      #
      # This endpoint is cached for up to 86400 seconds.
      #
      # @esi_version dev
      # @esi_version legacy
      # @esi_version v5
      #
      # @param character_id [Integer] An EVE character ID
      # @param params [Hash] Additional query string parameters
      # @param headers [Hash] Additional headers
      #
      # @raise [ESI::Errors::BadRequestError] Bad request
      # @raise [ESI::Errors::NotFoundError] Character not found
      # @raise [ESI::Errors::ErrorLimitedError] Error limited
      # @raise [ESI::Errors::InternalServerError] Internal server error
      # @raise [ESI::Errors::ServiceUnavailableError] Service unavailable
      # @raise [ESI::Errors::GatewayTimeoutError] Gateway timeout
      #
      # @see https://esi.evetech.net/ui/#/Character/get_characters_character_id
      def get_character(character_id:, headers: {}, params: {})
        parse_response(get_character_raw(character_id: character_id, headers: headers, params: params))
      end
      alias get_characters_character_id get_character

      # Public information about a character.
      #
      # This endpoint is cached for up to 86400 seconds.
      #
      # @esi_version dev
      # @esi_version legacy
      # @esi_version v5
      #
      # @param character_id [Integer] An EVE character ID
      # @param params [Hash] Additional query string parameters
      # @param headers [Hash] Additional headers
      #
      # @raise [ESI::Errors::BadRequestError] Bad request
      # @raise [ESI::Errors::NotFoundError] Character not found
      # @raise [ESI::Errors::ErrorLimitedError] Error limited
      # @raise [ESI::Errors::InternalServerError] Internal server error
      # @raise [ESI::Errors::ServiceUnavailableError] Service unavailable
      # @raise [ESI::Errors::GatewayTimeoutError] Gateway timeout
      #
      # @see https://esi.evetech.net/ui/#/Character/get_characters_character_id
      def get_character_raw(character_id:, headers: {}, params: {})
        get("/characters/#{character_id}/", headers: headers, params: params)
      end

      # Return a list of agents research information for a character. The formula for finding the current research points with an agent is: currentPoints = remainderPoints + pointsPerDay * days(currentTime - researchStartDate).
      #
      # This endpoint is cached for up to 3600 seconds.
      #
      # This endpoint requires authorization (see {ESI::Client#authorize}).
      #
      # @esi_scope esi-characters.read_agents_research.v1
      #
      # @esi_version dev
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
      # @see https://esi.evetech.net/ui/#/Character/get_characters_character_id_agents_research
      def get_character_agents_research(character_id:, headers: {}, params: {})
        parse_response(get_character_agents_research_raw(character_id: character_id, headers: headers, params: params))
      end
      alias get_characters_character_id_agents_research get_character_agents_research

      # Return a list of agents research information for a character. The formula for finding the current research points with an agent is: currentPoints = remainderPoints + pointsPerDay * days(currentTime - researchStartDate).
      #
      # This endpoint is cached for up to 3600 seconds.
      #
      # This endpoint requires authorization (see {ESI::Client#authorize}).
      #
      # @esi_scope esi-characters.read_agents_research.v1
      #
      # @esi_version dev
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
      # @see https://esi.evetech.net/ui/#/Character/get_characters_character_id_agents_research
      def get_character_agents_research_raw(character_id:, headers: {}, params: {})
        get("/characters/#{character_id}/agents_research/", headers: headers, params: params)
      end

      # Return a list of blueprints the character owns.
      #
      # This endpoint is cached for up to 3600 seconds.
      #
      # This endpoint requires authorization (see {ESI::Client#authorize}).
      #
      # @esi_scope esi-characters.read_blueprints.v1
      #
      # @esi_version dev
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
      # @see https://esi.evetech.net/ui/#/Character/get_characters_character_id_blueprints
      def get_character_blueprints(character_id:, headers: {}, params: {})
        concat_responses(get_character_blueprints_raw(character_id: character_id, headers: headers, params: params))
      end
      alias get_characters_character_id_blueprints get_character_blueprints

      # Return a list of blueprints the character owns.
      #
      # This endpoint is cached for up to 3600 seconds.
      #
      # This endpoint requires authorization (see {ESI::Client#authorize}).
      #
      # @esi_scope esi-characters.read_blueprints.v1
      #
      # @esi_version dev
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
      # @see https://esi.evetech.net/ui/#/Character/get_characters_character_id_blueprints
      def get_character_blueprints_raw(character_id:, headers: {}, params: {})
        get("/characters/#{character_id}/blueprints/", headers: headers, params: params)
      end

      # Get a list of all the corporations a character has been a member of.
      #
      # This endpoint is cached for up to 86400 seconds.
      #
      # @esi_version dev
      # @esi_version v2
      #
      # @param character_id [Integer] An EVE character ID
      # @param params [Hash] Additional query string parameters
      # @param headers [Hash] Additional headers
      #
      # @raise [ESI::Errors::BadRequestError] Bad request
      # @raise [ESI::Errors::ErrorLimitedError] Error limited
      # @raise [ESI::Errors::InternalServerError] Internal server error
      # @raise [ESI::Errors::ServiceUnavailableError] Service unavailable
      # @raise [ESI::Errors::GatewayTimeoutError] Gateway timeout
      #
      # @see https://esi.evetech.net/ui/#/Character/get_characters_character_id_corporationhistory
      def get_character_corporationhistory(character_id:, headers: {}, params: {})
        parse_response(get_character_corporationhistory_raw(character_id: character_id, headers: headers, params: params))
      end
      alias get_character_corporation_history get_character_corporationhistory
      alias get_characters_character_id_corporationhistory get_character_corporationhistory

      # Get a list of all the corporations a character has been a member of.
      #
      # This endpoint is cached for up to 86400 seconds.
      #
      # @esi_version dev
      # @esi_version v2
      #
      # @param character_id [Integer] An EVE character ID
      # @param params [Hash] Additional query string parameters
      # @param headers [Hash] Additional headers
      #
      # @raise [ESI::Errors::BadRequestError] Bad request
      # @raise [ESI::Errors::ErrorLimitedError] Error limited
      # @raise [ESI::Errors::InternalServerError] Internal server error
      # @raise [ESI::Errors::ServiceUnavailableError] Service unavailable
      # @raise [ESI::Errors::GatewayTimeoutError] Gateway timeout
      #
      # @see https://esi.evetech.net/ui/#/Character/get_characters_character_id_corporationhistory
      def get_character_corporationhistory_raw(character_id:, headers: {}, params: {})
        get("/characters/#{character_id}/corporationhistory/", headers: headers, params: params)
      end

      # Return a character's jump activation and fatigue information.
      #
      # This endpoint is cached for up to 300 seconds.
      #
      # This endpoint requires authorization (see {ESI::Client#authorize}).
      #
      # @esi_scope esi-characters.read_fatigue.v1
      #
      # @esi_version dev
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
      # @see https://esi.evetech.net/ui/#/Character/get_characters_character_id_fatigue
      def get_character_fatigue(character_id:, headers: {}, params: {})
        parse_response(get_character_fatigue_raw(character_id: character_id, headers: headers, params: params))
      end
      alias get_characters_character_id_fatigue get_character_fatigue

      # Return a character's jump activation and fatigue information.
      #
      # This endpoint is cached for up to 300 seconds.
      #
      # This endpoint requires authorization (see {ESI::Client#authorize}).
      #
      # @esi_scope esi-characters.read_fatigue.v1
      #
      # @esi_version dev
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
      # @see https://esi.evetech.net/ui/#/Character/get_characters_character_id_fatigue
      def get_character_fatigue_raw(character_id:, headers: {}, params: {})
        get("/characters/#{character_id}/fatigue/", headers: headers, params: params)
      end

      # Return a list of medals the character has.
      #
      # This endpoint is cached for up to 3600 seconds.
      #
      # This endpoint requires authorization (see {ESI::Client#authorize}).
      #
      # @esi_scope esi-characters.read_medals.v1
      #
      # @esi_version dev
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
      # @see https://esi.evetech.net/ui/#/Character/get_characters_character_id_medals
      def get_character_medals(character_id:, headers: {}, params: {})
        parse_response(get_character_medals_raw(character_id: character_id, headers: headers, params: params))
      end
      alias get_characters_character_id_medals get_character_medals

      # Return a list of medals the character has.
      #
      # This endpoint is cached for up to 3600 seconds.
      #
      # This endpoint requires authorization (see {ESI::Client#authorize}).
      #
      # @esi_scope esi-characters.read_medals.v1
      #
      # @esi_version dev
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
      # @see https://esi.evetech.net/ui/#/Character/get_characters_character_id_medals
      def get_character_medals_raw(character_id:, headers: {}, params: {})
        get("/characters/#{character_id}/medals/", headers: headers, params: params)
      end

      # Return notifications about having been added to someone's contact list.
      #
      # This endpoint is cached for up to 600 seconds.
      #
      # This endpoint requires authorization (see {ESI::Client#authorize}).
      #
      # @esi_scope esi-characters.read_notifications.v1
      #
      # @esi_version dev
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
      # @see https://esi.evetech.net/ui/#/Character/get_characters_character_id_notifications_contacts
      def get_character_notification_contacts(character_id:, headers: {}, params: {})
        parse_response(get_character_notification_contacts_raw(character_id: character_id, headers: headers, params: params))
      end
      alias get_characters_character_id_notifications_contacts get_character_notification_contacts

      # Return notifications about having been added to someone's contact list.
      #
      # This endpoint is cached for up to 600 seconds.
      #
      # This endpoint requires authorization (see {ESI::Client#authorize}).
      #
      # @esi_scope esi-characters.read_notifications.v1
      #
      # @esi_version dev
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
      # @see https://esi.evetech.net/ui/#/Character/get_characters_character_id_notifications_contacts
      def get_character_notification_contacts_raw(character_id:, headers: {}, params: {})
        get("/characters/#{character_id}/notifications/contacts/", headers: headers, params: params)
      end

      # Return character notifications.
      #
      # This endpoint is cached for up to 600 seconds.
      #
      # This endpoint requires authorization (see {ESI::Client#authorize}).
      #
      # @esi_scope esi-characters.read_notifications.v1
      #
      # @esi_version dev
      # @esi_version v5
      # @esi_version v6
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
      # @see https://esi.evetech.net/ui/#/Character/get_characters_character_id_notifications
      def get_character_notifications(character_id:, headers: {}, params: {})
        parse_response(get_character_notifications_raw(character_id: character_id, headers: headers, params: params))
      end
      alias get_characters_character_id_notifications get_character_notifications

      # Return character notifications.
      #
      # This endpoint is cached for up to 600 seconds.
      #
      # This endpoint requires authorization (see {ESI::Client#authorize}).
      #
      # @esi_scope esi-characters.read_notifications.v1
      #
      # @esi_version dev
      # @esi_version v5
      # @esi_version v6
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
      # @see https://esi.evetech.net/ui/#/Character/get_characters_character_id_notifications
      def get_character_notifications_raw(character_id:, headers: {}, params: {})
        get("/characters/#{character_id}/notifications/", headers: headers, params: params)
      end

      # Get portrait urls for a character.
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
      # @raise [ESI::Errors::NotFoundError] No image server for this datasource
      # @raise [ESI::Errors::ErrorLimitedError] Error limited
      # @raise [ESI::Errors::InternalServerError] Internal server error
      # @raise [ESI::Errors::ServiceUnavailableError] Service unavailable
      # @raise [ESI::Errors::GatewayTimeoutError] Gateway timeout
      #
      # @see https://esi.evetech.net/ui/#/Character/get_characters_character_id_portrait
      def get_character_portrait(character_id:, headers: {}, params: {})
        parse_response(get_character_portrait_raw(character_id: character_id, headers: headers, params: params))
      end
      alias get_characters_character_id_portrait get_character_portrait

      # Get portrait urls for a character.
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
      # @raise [ESI::Errors::NotFoundError] No image server for this datasource
      # @raise [ESI::Errors::ErrorLimitedError] Error limited
      # @raise [ESI::Errors::InternalServerError] Internal server error
      # @raise [ESI::Errors::ServiceUnavailableError] Service unavailable
      # @raise [ESI::Errors::GatewayTimeoutError] Gateway timeout
      #
      # @see https://esi.evetech.net/ui/#/Character/get_characters_character_id_portrait
      def get_character_portrait_raw(character_id:, headers: {}, params: {})
        get("/characters/#{character_id}/portrait/", headers: headers, params: params)
      end

      # Returns a character's corporation roles.
      #
      # This endpoint is cached for up to 3600 seconds.
      #
      # This endpoint requires authorization (see {ESI::Client#authorize}).
      #
      # @esi_scope esi-characters.read_corporation_roles.v1
      #
      # @esi_version dev
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
      # @see https://esi.evetech.net/ui/#/Character/get_characters_character_id_roles
      def get_character_roles(character_id:, headers: {}, params: {})
        parse_response(get_character_roles_raw(character_id: character_id, headers: headers, params: params))
      end
      alias get_characters_character_id_roles get_character_roles

      # Returns a character's corporation roles.
      #
      # This endpoint is cached for up to 3600 seconds.
      #
      # This endpoint requires authorization (see {ESI::Client#authorize}).
      #
      # @esi_scope esi-characters.read_corporation_roles.v1
      #
      # @esi_version dev
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
      # @see https://esi.evetech.net/ui/#/Character/get_characters_character_id_roles
      def get_character_roles_raw(character_id:, headers: {}, params: {})
        get("/characters/#{character_id}/roles/", headers: headers, params: params)
      end

      # Return character standings from agents, NPC corporations, and factions.
      #
      # This endpoint is cached for up to 3600 seconds.
      #
      # This endpoint requires authorization (see {ESI::Client#authorize}).
      #
      # @esi_scope esi-characters.read_standings.v1
      #
      # @esi_version dev
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
      # @see https://esi.evetech.net/ui/#/Character/get_characters_character_id_standings
      def get_character_standings(character_id:, headers: {}, params: {})
        parse_response(get_character_standings_raw(character_id: character_id, headers: headers, params: params))
      end
      alias get_characters_character_id_standings get_character_standings

      # Return character standings from agents, NPC corporations, and factions.
      #
      # This endpoint is cached for up to 3600 seconds.
      #
      # This endpoint requires authorization (see {ESI::Client#authorize}).
      #
      # @esi_scope esi-characters.read_standings.v1
      #
      # @esi_version dev
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
      # @see https://esi.evetech.net/ui/#/Character/get_characters_character_id_standings
      def get_character_standings_raw(character_id:, headers: {}, params: {})
        get("/characters/#{character_id}/standings/", headers: headers, params: params)
      end

      # Returns a character's titles.
      #
      # This endpoint is cached for up to 3600 seconds.
      #
      # This endpoint requires authorization (see {ESI::Client#authorize}).
      #
      # @esi_scope esi-characters.read_titles.v1
      #
      # @esi_version dev
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
      # @see https://esi.evetech.net/ui/#/Character/get_characters_character_id_titles
      def get_character_titles(character_id:, headers: {}, params: {})
        parse_response(get_character_titles_raw(character_id: character_id, headers: headers, params: params))
      end
      alias get_characters_character_id_titles get_character_titles

      # Returns a character's titles.
      #
      # This endpoint is cached for up to 3600 seconds.
      #
      # This endpoint requires authorization (see {ESI::Client#authorize}).
      #
      # @esi_scope esi-characters.read_titles.v1
      #
      # @esi_version dev
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
      # @see https://esi.evetech.net/ui/#/Character/get_characters_character_id_titles
      def get_character_titles_raw(character_id:, headers: {}, params: {})
        get("/characters/#{character_id}/titles/", headers: headers, params: params)
      end

      # Takes a source character ID in the url and a set of target character ID's in the body, returns a CSPA charge cost.
      #
      # This endpoint requires authorization (see {ESI::Client#authorize}).
      #
      # @esi_scope esi-characters.read_contacts.v1
      #
      # @esi_version dev
      # @esi_version v5
      #
      # @param character_id [Integer] An EVE character ID
      # @param characters [Array] The target characters to calculate the charge for
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
      # @see https://esi.evetech.net/ui/#/Character/post_characters_character_id_cspa
      def post_character_cspa(character_id:, characters:, headers: {}, params: {})
        parse_response(post_character_cspa_raw(character_id: character_id, characters: characters, headers: headers, params: params))
      end
      alias post_characters_character_id_cspa post_character_cspa

      # Takes a source character ID in the url and a set of target character ID's in the body, returns a CSPA charge cost.
      #
      # This endpoint requires authorization (see {ESI::Client#authorize}).
      #
      # @esi_scope esi-characters.read_contacts.v1
      #
      # @esi_version dev
      # @esi_version v5
      #
      # @param character_id [Integer] An EVE character ID
      # @param characters [Array] The target characters to calculate the charge for
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
      # @see https://esi.evetech.net/ui/#/Character/post_characters_character_id_cspa
      def post_character_cspa_raw(character_id:, characters:, headers: {}, params: {})
        post("/characters/#{character_id}/cspa/", headers: headers, params: params, payload: characters)
      end

      # Bulk lookup of character IDs to corporation, alliance and faction.
      #
      # This endpoint is cached for up to 3600 seconds.
      #
      # @esi_version dev
      # @esi_version v2
      #
      # @param characters [Array] The character IDs to fetch affiliations for. All characters must exist, or none will be returned
      # @param params [Hash] Additional query string parameters
      # @param headers [Hash] Additional headers
      #
      # @raise [ESI::Errors::BadRequestError] Bad request
      # @raise [ESI::Errors::ErrorLimitedError] Error limited
      # @raise [ESI::Errors::InternalServerError] Internal server error
      # @raise [ESI::Errors::ServiceUnavailableError] Service unavailable
      # @raise [ESI::Errors::GatewayTimeoutError] Gateway timeout
      #
      # @see https://esi.evetech.net/ui/#/Character/post_characters_affiliation
      def post_characters_affiliation(characters:, headers: {}, params: {})
        parse_response(post_characters_affiliation_raw(characters: characters, headers: headers, params: params))
      end

      # Bulk lookup of character IDs to corporation, alliance and faction.
      #
      # This endpoint is cached for up to 3600 seconds.
      #
      # @esi_version dev
      # @esi_version v2
      #
      # @param characters [Array] The character IDs to fetch affiliations for. All characters must exist, or none will be returned
      # @param params [Hash] Additional query string parameters
      # @param headers [Hash] Additional headers
      #
      # @raise [ESI::Errors::BadRequestError] Bad request
      # @raise [ESI::Errors::ErrorLimitedError] Error limited
      # @raise [ESI::Errors::InternalServerError] Internal server error
      # @raise [ESI::Errors::ServiceUnavailableError] Service unavailable
      # @raise [ESI::Errors::GatewayTimeoutError] Gateway timeout
      #
      # @see https://esi.evetech.net/ui/#/Character/post_characters_affiliation
      def post_characters_affiliation_raw(characters:, headers: {}, params: {})
        post('/characters/affiliation/', headers: headers, params: params, payload: characters)
      end
    end
  end
end
