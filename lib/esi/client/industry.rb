# frozen_string_literal: true

module ESI
  class Client
    # ESI industry operations.
    module Industry
      # List industry jobs placed by a character.
      #
      # This endpoint is cached for up to 300 seconds.
      #
      # This endpoint requires authorization (see {ESI::Client#authorize}).
      #
      # @esi_scope esi-industry.read_character_jobs.v1
      #
      # @esi_version dev
      # @esi_version legacy
      # @esi_version v1
      #
      # @param character_id [Integer] An EVE character ID
      # @param include_completed [Boolean] Whether to retrieve completed character industry jobs. Only includes jobs from the past 90 days
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
      # @see https://esi.evetech.net/ui/#/Industry/get_characters_character_id_industry_jobs
      def get_character_industry_jobs(character_id:, include_completed: nil, headers: {}, params: {})
        params.merge!("include_completed" => include_completed)
        get("/characters/#{character_id}/industry/jobs/", headers: headers, params: params).json
      end
      alias get_characters_character_id_industry_jobs get_character_industry_jobs

      # Paginated record of all mining done by a character for the past 30 days.
      #
      # This endpoint is cached for up to 600 seconds.
      #
      # This endpoint requires authorization (see {ESI::Client#authorize}).
      #
      # @esi_scope esi-industry.read_character_mining.v1
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
      # @see https://esi.evetech.net/ui/#/Industry/get_characters_character_id_mining
      def get_character_mining(character_id:, headers: {}, params: {})
        responses = get("/characters/#{character_id}/mining/", headers: headers, params: params)
        responses.map(&:json).reduce([], :concat)
      end
      alias get_characters_character_id_mining get_character_mining

      # List industry jobs run by a corporation.
      #
      # This endpoint is cached for up to 300 seconds.
      #
      # This endpoint requires authorization (see {ESI::Client#authorize}).
      #
      # @esi_scope esi-industry.read_corporation_jobs.v1
      #
      # @esi_version dev
      # @esi_version legacy
      # @esi_version v1
      #
      # @param corporation_id [Integer] An EVE corporation ID
      # @param include_completed [Boolean] Whether to retrieve completed corporation industry jobs. Only includes jobs from the past 90 days
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
      # @see https://esi.evetech.net/ui/#/Industry/get_corporations_corporation_id_industry_jobs
      def get_corporation_industry_jobs(corporation_id:, include_completed: nil, headers: {}, params: {})
        params.merge!("include_completed" => include_completed)
        responses = get("/corporations/#{corporation_id}/industry/jobs/", headers: headers, params: params)
        responses.map(&:json).reduce([], :concat)
      end
      alias get_corporations_corporation_id_industry_jobs get_corporation_industry_jobs

      # Extraction timers for all moon chunks being extracted by refineries belonging to a corporation.
      #
      # This endpoint is cached for up to 1800 seconds.
      #
      # This endpoint requires authorization (see {ESI::Client#authorize}).
      #
      # @esi_scope esi-industry.read_corporation_mining.v1
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
      # @see https://esi.evetech.net/ui/#/Industry/get_corporation_corporation_id_mining_extractions
      def get_corporation_mining_extractions(corporation_id:, headers: {}, params: {})
        responses = get("/corporation/#{corporation_id}/mining/extractions/", headers: headers, params: params)
        responses.map(&:json).reduce([], :concat)
      end
      alias get_corporation_corporation_id_mining_extractions get_corporation_mining_extractions

      # Paginated record of all mining seen by an observer.
      #
      # This endpoint is cached for up to 3600 seconds.
      #
      # This endpoint requires authorization (see {ESI::Client#authorize}).
      #
      # @esi_scope esi-industry.read_corporation_mining.v1
      #
      # @esi_version dev
      # @esi_version legacy
      # @esi_version v1
      #
      # @param corporation_id [Integer] An EVE corporation ID
      # @param observer_id [Integer] A mining observer id
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
      # @see https://esi.evetech.net/ui/#/Industry/get_corporation_corporation_id_mining_observers_observer_id
      def get_corporation_mining_observer(corporation_id:, observer_id:, headers: {}, params: {})
        responses = get("/corporation/#{corporation_id}/mining/observers/#{observer_id}/", headers: headers, params: params)
        responses.map(&:json).reduce([], :concat)
      end
      alias get_corporation_corporation_id_mining_observers_observer_id get_corporation_mining_observer

      # Paginated list of all entities capable of observing and recording mining for a corporation.
      #
      # This endpoint is cached for up to 3600 seconds.
      #
      # This endpoint requires authorization (see {ESI::Client#authorize}).
      #
      # @esi_scope esi-industry.read_corporation_mining.v1
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
      # @see https://esi.evetech.net/ui/#/Industry/get_corporation_corporation_id_mining_observers
      def get_corporation_mining_observers(corporation_id:, headers: {}, params: {})
        responses = get("/corporation/#{corporation_id}/mining/observers/", headers: headers, params: params)
        responses.map(&:json).reduce([], :concat)
      end
      alias get_corporation_corporation_id_mining_observers get_corporation_mining_observers

      # Return a list of industry facilities.
      #
      # This endpoint is cached for up to 3600 seconds.
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
      # @see https://esi.evetech.net/ui/#/Industry/get_industry_facilities
      def get_industry_facilities(headers: {}, params: {})
        get("/industry/facilities/", headers: headers, params: params).json
      end

      # Return cost indices for solar systems.
      #
      # This endpoint is cached for up to 3600 seconds.
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
      # @see https://esi.evetech.net/ui/#/Industry/get_industry_systems
      def get_industry_systems(headers: {}, params: {})
        get("/industry/systems/", headers: headers, params: params).json
      end
    end
  end
end
