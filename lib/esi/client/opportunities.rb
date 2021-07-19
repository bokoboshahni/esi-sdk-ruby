# frozen_string_literal: true

module ESI
  class Client
    # ESI opportunities operations.
    module Opportunity
      # Return a list of tasks finished by a character.
      #
      # This endpoint is cached for up to 3600 seconds.
      #
      # This endpoint requires authorization (see {ESI::Client#authorize}).
      #
      # @esi_scope esi-characters.read_opportunities.v1
      #
      # @esi_version dev
      # @esi_version legacy
      # @esi_version v1
      #
      # @param character_id [Integer,String] An EVE character ID
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
      # @see https://esi.evetech.net/ui/#/Opportunities/get_characters_character_id_opportunities
      def get_character_opportunities(character_id:, params: {}, headers: {})
        get("/characters/#{character_id}/opportunities/", headers: headers, params: params)
      end
      alias get_characters_character_id_opportunities get_character_opportunities

      # Return information of an opportunities group.
      #
      # @esi_version dev
      # @esi_version legacy
      # @esi_version v1
      #
      # @param group_id [Integer,String] ID of an opportunities group
      # @param params [Hash] Additional query string parameters
      # @param headers [Hash] Additional headers
      #
      # @raise [ESI::Errors::BadRequestError] Bad request
      # @raise [ESI::Errors::ErrorLimitedError] Error limited
      # @raise [ESI::Errors::InternalServerError] Internal server error
      # @raise [ESI::Errors::ServiceUnavailableError] Service unavailable
      # @raise [ESI::Errors::GatewayTimeoutError] Gateway timeout
      #
      # @see https://esi.evetech.net/ui/#/Opportunities/get_opportunities_groups_group_id
      def get_opportunities_group(group_id:, params: {}, headers: {})
        get("/opportunities/groups/#{group_id}/", headers: headers, params: params)
      end
      alias get_opportunities_groups_group_id get_opportunities_group

      # Return information of an opportunities task.
      #
      # @esi_version dev
      # @esi_version legacy
      # @esi_version v1
      #
      # @param task_id [Integer,String] ID of an opportunities task
      # @param params [Hash] Additional query string parameters
      # @param headers [Hash] Additional headers
      #
      # @raise [ESI::Errors::BadRequestError] Bad request
      # @raise [ESI::Errors::ErrorLimitedError] Error limited
      # @raise [ESI::Errors::InternalServerError] Internal server error
      # @raise [ESI::Errors::ServiceUnavailableError] Service unavailable
      # @raise [ESI::Errors::GatewayTimeoutError] Gateway timeout
      #
      # @see https://esi.evetech.net/ui/#/Opportunities/get_opportunities_tasks_task_id
      def get_opportunities_task(task_id:, params: {}, headers: {})
        get("/opportunities/tasks/#{task_id}/", headers: headers, params: params)
      end
      alias get_opportunities_tasks_task_id get_opportunities_task

      # Return a list of opportunities groups.
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
      # @see https://esi.evetech.net/ui/#/Opportunities/get_opportunities_groups
      def get_opportunity_groups(params: {}, headers: {})
        get("/opportunities/groups/", headers: headers, params: params)
      end
      alias get_opportunities_groups get_opportunity_groups

      # Return a list of opportunities tasks.
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
      # @see https://esi.evetech.net/ui/#/Opportunities/get_opportunities_tasks
      def get_opportunity_tasks(params: {}, headers: {})
        get("/opportunities/tasks/", headers: headers, params: params)
      end
      alias get_opportunities_tasks get_opportunity_tasks
    end
  end
end