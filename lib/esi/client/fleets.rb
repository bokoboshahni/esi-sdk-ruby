# frozen_string_literal: true

module ESI
  class Client
    # ESI fleets operations.
    module Fleet
      # Kick a fleet member.
      #
      # This endpoint requires authorization (see {ESI::Client#authorize}).
      #
      # @esi_scope esi-fleets.write_fleet.v1
      #
      # @esi_version dev
      # @esi_version legacy
      # @esi_version v1
      #
      # @param fleet_id [Integer] ID for a fleet
      # @param member_id [Integer] The character ID of a member in this fleet
      # @param params [Hash] Additional query string parameters
      # @param headers [Hash] Additional headers
      #
      # @raise [ESI::Errors::BadRequestError] Bad request
      # @raise [ESI::Errors::UnauthorizedError] Unauthorized
      # @raise [ESI::Errors::ForbiddenError] Forbidden
      # @raise [ESI::Errors::NotFoundError] The fleet does not exist or you don't have access to it
      # @raise [ESI::Errors::ErrorLimitedError] Error limited
      # @raise [ESI::Errors::InternalServerError] Internal server error
      # @raise [ESI::Errors::ServiceUnavailableError] Service unavailable
      # @raise [ESI::Errors::GatewayTimeoutError] Gateway timeout
      #
      # @see https://esi.evetech.net/ui/#/Fleets/delete_fleets_fleet_id_members_member_id
      def delete_fleet_member(fleet_id:, member_id:, headers: {}, params: {})
        delete("/fleets/#{fleet_id}/members/#{member_id}/", headers: headers, params: params)
      end
      alias delete_fleets_fleet_id_members_member_id delete_fleet_member

      # Delete a fleet squad, only empty squads can be deleted.
      #
      # This endpoint requires authorization (see {ESI::Client#authorize}).
      #
      # @esi_scope esi-fleets.write_fleet.v1
      #
      # @esi_version dev
      # @esi_version legacy
      # @esi_version v1
      #
      # @param fleet_id [Integer] ID for a fleet
      # @param squad_id [Integer] The squad to delete
      # @param params [Hash] Additional query string parameters
      # @param headers [Hash] Additional headers
      #
      # @raise [ESI::Errors::BadRequestError] Bad request
      # @raise [ESI::Errors::UnauthorizedError] Unauthorized
      # @raise [ESI::Errors::ForbiddenError] Forbidden
      # @raise [ESI::Errors::NotFoundError] The fleet does not exist or you don't have access to it
      # @raise [ESI::Errors::ErrorLimitedError] Error limited
      # @raise [ESI::Errors::InternalServerError] Internal server error
      # @raise [ESI::Errors::ServiceUnavailableError] Service unavailable
      # @raise [ESI::Errors::GatewayTimeoutError] Gateway timeout
      #
      # @see https://esi.evetech.net/ui/#/Fleets/delete_fleets_fleet_id_squads_squad_id
      def delete_fleet_squad(fleet_id:, squad_id:, headers: {}, params: {})
        delete("/fleets/#{fleet_id}/squads/#{squad_id}/", headers: headers, params: params)
      end
      alias delete_fleets_fleet_id_squads_squad_id delete_fleet_squad

      # Delete a fleet wing, only empty wings can be deleted. The wing may contain squads, but the squads must be empty.
      #
      # This endpoint requires authorization (see {ESI::Client#authorize}).
      #
      # @esi_scope esi-fleets.write_fleet.v1
      #
      # @esi_version dev
      # @esi_version legacy
      # @esi_version v1
      #
      # @param fleet_id [Integer] ID for a fleet
      # @param wing_id [Integer] The wing to delete
      # @param params [Hash] Additional query string parameters
      # @param headers [Hash] Additional headers
      #
      # @raise [ESI::Errors::BadRequestError] Bad request
      # @raise [ESI::Errors::UnauthorizedError] Unauthorized
      # @raise [ESI::Errors::ForbiddenError] Forbidden
      # @raise [ESI::Errors::NotFoundError] The fleet does not exist or you don't have access to it
      # @raise [ESI::Errors::ErrorLimitedError] Error limited
      # @raise [ESI::Errors::InternalServerError] Internal server error
      # @raise [ESI::Errors::ServiceUnavailableError] Service unavailable
      # @raise [ESI::Errors::GatewayTimeoutError] Gateway timeout
      #
      # @see https://esi.evetech.net/ui/#/Fleets/delete_fleets_fleet_id_wings_wing_id
      def delete_fleet_wing(fleet_id:, wing_id:, headers: {}, params: {})
        delete("/fleets/#{fleet_id}/wings/#{wing_id}/", headers: headers, params: params)
      end
      alias delete_fleets_fleet_id_wings_wing_id delete_fleet_wing

      # Return the fleet ID the character is in, if any.
      #
      # This endpoint is cached for up to 60 seconds.
      #
      # This endpoint requires authorization (see {ESI::Client#authorize}).
      #
      # @esi_scope esi-fleets.read_fleet.v1
      #
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
      # @raise [ESI::Errors::NotFoundError] The character is not in a fleet
      # @raise [ESI::Errors::ErrorLimitedError] Error limited
      # @raise [ESI::Errors::InternalServerError] Internal server error
      # @raise [ESI::Errors::ServiceUnavailableError] Service unavailable
      # @raise [ESI::Errors::GatewayTimeoutError] Gateway timeout
      #
      # @see https://esi.evetech.net/ui/#/Fleets/get_characters_character_id_fleet
      def get_character_fleet(character_id:, headers: {}, params: {})
        get("/characters/#{character_id}/fleet/", headers: headers, params: params)
      end
      alias get_characters_character_id_fleet get_character_fleet

      # Return details about a fleet.
      #
      # This endpoint is cached for up to 5 seconds.
      #
      # This endpoint requires authorization (see {ESI::Client#authorize}).
      #
      # @esi_scope esi-fleets.read_fleet.v1
      #
      # @esi_version dev
      # @esi_version legacy
      # @esi_version v1
      #
      # @param fleet_id [Integer] ID for a fleet
      # @param params [Hash] Additional query string parameters
      # @param headers [Hash] Additional headers
      #
      # @raise [ESI::Errors::BadRequestError] Bad request
      # @raise [ESI::Errors::UnauthorizedError] Unauthorized
      # @raise [ESI::Errors::ForbiddenError] Forbidden
      # @raise [ESI::Errors::NotFoundError] The fleet does not exist or you don't have access to it
      # @raise [ESI::Errors::ErrorLimitedError] Error limited
      # @raise [ESI::Errors::InternalServerError] Internal server error
      # @raise [ESI::Errors::ServiceUnavailableError] Service unavailable
      # @raise [ESI::Errors::GatewayTimeoutError] Gateway timeout
      #
      # @see https://esi.evetech.net/ui/#/Fleets/get_fleets_fleet_id
      def get_fleet(fleet_id:, headers: {}, params: {})
        get("/fleets/#{fleet_id}/", headers: headers, params: params)
      end
      alias get_fleets_fleet_id get_fleet

      # Return information about fleet members.
      #
      # This endpoint is cached for up to 5 seconds.
      #
      # This endpoint requires authorization (see {ESI::Client#authorize}).
      #
      # @esi_scope esi-fleets.read_fleet.v1
      #
      # @esi_version dev
      # @esi_version legacy
      # @esi_version v1
      #
      # @param fleet_id [Integer] ID for a fleet
      # @param params [Hash] Additional query string parameters
      # @param headers [Hash] Additional headers
      #
      # @raise [ESI::Errors::BadRequestError] Bad request
      # @raise [ESI::Errors::UnauthorizedError] Unauthorized
      # @raise [ESI::Errors::ForbiddenError] Forbidden
      # @raise [ESI::Errors::NotFoundError] The fleet does not exist or you don't have access to it
      # @raise [ESI::Errors::ErrorLimitedError] Error limited
      # @raise [ESI::Errors::InternalServerError] Internal server error
      # @raise [ESI::Errors::ServiceUnavailableError] Service unavailable
      # @raise [ESI::Errors::GatewayTimeoutError] Gateway timeout
      #
      # @see https://esi.evetech.net/ui/#/Fleets/get_fleets_fleet_id_members
      def get_fleet_members(fleet_id:, headers: {}, params: {})
        get("/fleets/#{fleet_id}/members/", headers: headers, params: params)
      end
      alias get_fleets_fleet_id_members get_fleet_members

      # Return information about wings in a fleet.
      #
      # This endpoint is cached for up to 5 seconds.
      #
      # This endpoint requires authorization (see {ESI::Client#authorize}).
      #
      # @esi_scope esi-fleets.read_fleet.v1
      #
      # @esi_version dev
      # @esi_version legacy
      # @esi_version v1
      #
      # @param fleet_id [Integer] ID for a fleet
      # @param params [Hash] Additional query string parameters
      # @param headers [Hash] Additional headers
      #
      # @raise [ESI::Errors::BadRequestError] Bad request
      # @raise [ESI::Errors::UnauthorizedError] Unauthorized
      # @raise [ESI::Errors::ForbiddenError] Forbidden
      # @raise [ESI::Errors::NotFoundError] The fleet does not exist or you don't have access to it
      # @raise [ESI::Errors::ErrorLimitedError] Error limited
      # @raise [ESI::Errors::InternalServerError] Internal server error
      # @raise [ESI::Errors::ServiceUnavailableError] Service unavailable
      # @raise [ESI::Errors::GatewayTimeoutError] Gateway timeout
      #
      # @see https://esi.evetech.net/ui/#/Fleets/get_fleets_fleet_id_wings
      def get_fleet_wings(fleet_id:, headers: {}, params: {})
        get("/fleets/#{fleet_id}/wings/", headers: headers, params: params)
      end
      alias get_fleets_fleet_id_wings get_fleet_wings

      # Invite a character into the fleet. If a character has a CSPA charge set it is not possible to invite them to the fleet using ESI.
      #
      # This endpoint requires authorization (see {ESI::Client#authorize}).
      #
      # @esi_scope esi-fleets.write_fleet.v1
      #
      # @esi_version dev
      # @esi_version legacy
      # @esi_version v1
      #
      # @param fleet_id [Integer] ID for a fleet
      # @param invitation [Hash] Details of the invitation
      # @param params [Hash] Additional query string parameters
      # @param headers [Hash] Additional headers
      #
      # @raise [ESI::Errors::BadRequestError] Bad request
      # @raise [ESI::Errors::UnauthorizedError] Unauthorized
      # @raise [ESI::Errors::ForbiddenError] Forbidden
      # @raise [ESI::Errors::NotFoundError] The fleet does not exist or you don't have access to it
      # @raise [ESI::Errors::ErrorLimitedError] Error limited
      # @raise [ESI::Errors::UnprocessableEntityError] Errors in invitation
      # @raise [ESI::Errors::InternalServerError] Internal server error
      # @raise [ESI::Errors::ServiceUnavailableError] Service unavailable
      # @raise [ESI::Errors::GatewayTimeoutError] Gateway timeout
      #
      # @see https://esi.evetech.net/ui/#/Fleets/post_fleets_fleet_id_members
      def post_fleet_members(fleet_id:, invitation:, headers: {}, params: {})
        post("/fleets/#{fleet_id}/members/", headers: headers, params: params, payload: invitation)
      end
      alias post_fleets_fleet_id_members post_fleet_members

      # Create a new squad in a fleet.
      #
      # This endpoint requires authorization (see {ESI::Client#authorize}).
      #
      # @esi_scope esi-fleets.write_fleet.v1
      #
      # @esi_version dev
      # @esi_version legacy
      # @esi_version v1
      #
      # @param fleet_id [Integer] ID for a fleet
      # @param wing_id [Integer] The wing_id to create squad in
      # @param params [Hash] Additional query string parameters
      # @param headers [Hash] Additional headers
      #
      # @raise [ESI::Errors::BadRequestError] Bad request
      # @raise [ESI::Errors::UnauthorizedError] Unauthorized
      # @raise [ESI::Errors::ForbiddenError] Forbidden
      # @raise [ESI::Errors::NotFoundError] The fleet does not exist or you don't have access to it
      # @raise [ESI::Errors::ErrorLimitedError] Error limited
      # @raise [ESI::Errors::InternalServerError] Internal server error
      # @raise [ESI::Errors::ServiceUnavailableError] Service unavailable
      # @raise [ESI::Errors::GatewayTimeoutError] Gateway timeout
      #
      # @see https://esi.evetech.net/ui/#/Fleets/post_fleets_fleet_id_wings_wing_id_squads
      def post_fleet_wing_squads(fleet_id:, wing_id:, headers: {}, params: {})
        post("/fleets/#{fleet_id}/wings/#{wing_id}/squads/", headers: headers, params: params)
      end
      alias post_fleets_fleet_id_wings_wing_id_squads post_fleet_wing_squads

      # Create a new wing in a fleet.
      #
      # This endpoint requires authorization (see {ESI::Client#authorize}).
      #
      # @esi_scope esi-fleets.write_fleet.v1
      #
      # @esi_version dev
      # @esi_version legacy
      # @esi_version v1
      #
      # @param fleet_id [Integer] ID for a fleet
      # @param params [Hash] Additional query string parameters
      # @param headers [Hash] Additional headers
      #
      # @raise [ESI::Errors::BadRequestError] Bad request
      # @raise [ESI::Errors::UnauthorizedError] Unauthorized
      # @raise [ESI::Errors::ForbiddenError] Forbidden
      # @raise [ESI::Errors::NotFoundError] The fleet does not exist or you don't have access to it
      # @raise [ESI::Errors::ErrorLimitedError] Error limited
      # @raise [ESI::Errors::InternalServerError] Internal server error
      # @raise [ESI::Errors::ServiceUnavailableError] Service unavailable
      # @raise [ESI::Errors::GatewayTimeoutError] Gateway timeout
      #
      # @see https://esi.evetech.net/ui/#/Fleets/post_fleets_fleet_id_wings
      def post_fleet_wings(fleet_id:, headers: {}, params: {})
        post("/fleets/#{fleet_id}/wings/", headers: headers, params: params)
      end
      alias post_fleets_fleet_id_wings post_fleet_wings

      # Update settings about a fleet.
      #
      # This endpoint requires authorization (see {ESI::Client#authorize}).
      #
      # @esi_scope esi-fleets.write_fleet.v1
      #
      # @esi_version dev
      # @esi_version legacy
      # @esi_version v1
      #
      # @param fleet_id [Integer] ID for a fleet
      # @param new_settings [Hash] What to update for this fleet
      # @param params [Hash] Additional query string parameters
      # @param headers [Hash] Additional headers
      #
      # @raise [ESI::Errors::BadRequestError] Bad request
      # @raise [ESI::Errors::UnauthorizedError] Unauthorized
      # @raise [ESI::Errors::ForbiddenError] Forbidden
      # @raise [ESI::Errors::NotFoundError] The fleet does not exist or you don't have access to it
      # @raise [ESI::Errors::ErrorLimitedError] Error limited
      # @raise [ESI::Errors::InternalServerError] Internal server error
      # @raise [ESI::Errors::ServiceUnavailableError] Service unavailable
      # @raise [ESI::Errors::GatewayTimeoutError] Gateway timeout
      #
      # @see https://esi.evetech.net/ui/#/Fleets/put_fleets_fleet_id
      def put_fleet(fleet_id:, new_settings:, headers: {}, params: {})
        put("/fleets/#{fleet_id}/", headers: headers, params: params, payload: new_settings)
      end
      alias put_fleets_fleet_id put_fleet

      # Move a fleet member around.
      #
      # This endpoint requires authorization (see {ESI::Client#authorize}).
      #
      # @esi_scope esi-fleets.write_fleet.v1
      #
      # @esi_version dev
      # @esi_version legacy
      # @esi_version v1
      #
      # @param fleet_id [Integer] ID for a fleet
      # @param member_id [Integer] The character ID of a member in this fleet
      # @param movement [Hash] Details of the invitation
      # @param params [Hash] Additional query string parameters
      # @param headers [Hash] Additional headers
      #
      # @raise [ESI::Errors::BadRequestError] Bad request
      # @raise [ESI::Errors::UnauthorizedError] Unauthorized
      # @raise [ESI::Errors::ForbiddenError] Forbidden
      # @raise [ESI::Errors::NotFoundError] The fleet does not exist or you don't have access to it
      # @raise [ESI::Errors::ErrorLimitedError] Error limited
      # @raise [ESI::Errors::UnprocessableEntityError] Errors in invitation
      # @raise [ESI::Errors::InternalServerError] Internal server error
      # @raise [ESI::Errors::ServiceUnavailableError] Service unavailable
      # @raise [ESI::Errors::GatewayTimeoutError] Gateway timeout
      #
      # @see https://esi.evetech.net/ui/#/Fleets/put_fleets_fleet_id_members_member_id
      def put_fleet_member(fleet_id:, member_id:, movement:, headers: {}, params: {})
        put("/fleets/#{fleet_id}/members/#{member_id}/", headers: headers, params: params, payload: movement)
      end
      alias put_fleets_fleet_id_members_member_id put_fleet_member

      # Rename a fleet squad.
      #
      # This endpoint requires authorization (see {ESI::Client#authorize}).
      #
      # @esi_scope esi-fleets.write_fleet.v1
      #
      # @esi_version dev
      # @esi_version legacy
      # @esi_version v1
      #
      # @param fleet_id [Integer] ID for a fleet
      # @param squad_id [Integer] The squad to rename
      # @param naming [Hash] New name of the squad
      # @param params [Hash] Additional query string parameters
      # @param headers [Hash] Additional headers
      #
      # @raise [ESI::Errors::BadRequestError] Bad request
      # @raise [ESI::Errors::UnauthorizedError] Unauthorized
      # @raise [ESI::Errors::ForbiddenError] Forbidden
      # @raise [ESI::Errors::NotFoundError] The fleet does not exist or you don't have access to it
      # @raise [ESI::Errors::ErrorLimitedError] Error limited
      # @raise [ESI::Errors::InternalServerError] Internal server error
      # @raise [ESI::Errors::ServiceUnavailableError] Service unavailable
      # @raise [ESI::Errors::GatewayTimeoutError] Gateway timeout
      #
      # @see https://esi.evetech.net/ui/#/Fleets/put_fleets_fleet_id_squads_squad_id
      def put_fleet_squad(fleet_id:, squad_id:, naming:, headers: {}, params: {})
        put("/fleets/#{fleet_id}/squads/#{squad_id}/", headers: headers, params: params, payload: naming)
      end
      alias put_fleets_fleet_id_squads_squad_id put_fleet_squad

      # Rename a fleet wing.
      #
      # This endpoint requires authorization (see {ESI::Client#authorize}).
      #
      # @esi_scope esi-fleets.write_fleet.v1
      #
      # @esi_version dev
      # @esi_version legacy
      # @esi_version v1
      #
      # @param fleet_id [Integer] ID for a fleet
      # @param wing_id [Integer] The wing to rename
      # @param naming [Hash] New name of the wing
      # @param params [Hash] Additional query string parameters
      # @param headers [Hash] Additional headers
      #
      # @raise [ESI::Errors::BadRequestError] Bad request
      # @raise [ESI::Errors::UnauthorizedError] Unauthorized
      # @raise [ESI::Errors::ForbiddenError] Forbidden
      # @raise [ESI::Errors::NotFoundError] The fleet does not exist or you don't have access to it
      # @raise [ESI::Errors::ErrorLimitedError] Error limited
      # @raise [ESI::Errors::InternalServerError] Internal server error
      # @raise [ESI::Errors::ServiceUnavailableError] Service unavailable
      # @raise [ESI::Errors::GatewayTimeoutError] Gateway timeout
      #
      # @see https://esi.evetech.net/ui/#/Fleets/put_fleets_fleet_id_wings_wing_id
      def put_fleet_wing(fleet_id:, wing_id:, naming:, headers: {}, params: {})
        put("/fleets/#{fleet_id}/wings/#{wing_id}/", headers: headers, params: params, payload: naming)
      end
      alias put_fleets_fleet_id_wings_wing_id put_fleet_wing
    end
  end
end
