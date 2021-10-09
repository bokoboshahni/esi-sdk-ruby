# frozen_string_literal: true

module ESI
  class Client
    # ESI assets operations.
    module Asset
      # Return a list of the characters assets.
      #
      # This endpoint is cached for up to 3600 seconds.
      #
      # This endpoint requires authorization (see {ESI::Client#authorize}).
      #
      # @esi_scope esi-assets.read_assets.v1
      #
      # @esi_version dev
      # @esi_version v5
      #
      # @param character_id [Integer] An EVE character ID
      # @param params [Hash] Additional query string parameters
      # @param headers [Hash] Additional headers
      #
      # @raise [ESI::Errors::BadRequestError] Bad request
      # @raise [ESI::Errors::UnauthorizedError] Unauthorized
      # @raise [ESI::Errors::ForbiddenError] Forbidden
      # @raise [ESI::Errors::NotFoundError] Requested page does not exist
      # @raise [ESI::Errors::ErrorLimitedError] Error limited
      # @raise [ESI::Errors::InternalServerError] Internal server error
      # @raise [ESI::Errors::ServiceUnavailableError] Service unavailable
      # @raise [ESI::Errors::GatewayTimeoutError] Gateway timeout
      #
      # @see https://esi.evetech.net/ui/#/Assets/get_characters_character_id_assets
      def get_character_assets(character_id:, headers: {}, params: {})
        responses = get_character_assets_raw(character_id: character_id, headers: headers, params: params)
        responses.map(&:json).reduce([], :concat)
      end
      alias get_characters_character_id_assets get_character_assets

      # Return a list of the characters assets.
      #
      # This endpoint is cached for up to 3600 seconds.
      #
      # This endpoint requires authorization (see {ESI::Client#authorize}).
      #
      # @esi_scope esi-assets.read_assets.v1
      #
      # @esi_version dev
      # @esi_version v5
      #
      # @param character_id [Integer] An EVE character ID
      # @param params [Hash] Additional query string parameters
      # @param headers [Hash] Additional headers
      #
      # @raise [ESI::Errors::BadRequestError] Bad request
      # @raise [ESI::Errors::UnauthorizedError] Unauthorized
      # @raise [ESI::Errors::ForbiddenError] Forbidden
      # @raise [ESI::Errors::NotFoundError] Requested page does not exist
      # @raise [ESI::Errors::ErrorLimitedError] Error limited
      # @raise [ESI::Errors::InternalServerError] Internal server error
      # @raise [ESI::Errors::ServiceUnavailableError] Service unavailable
      # @raise [ESI::Errors::GatewayTimeoutError] Gateway timeout
      #
      # @see https://esi.evetech.net/ui/#/Assets/get_characters_character_id_assets
      def get_character_assets_raw(character_id:, headers: {}, params: {})
        get("/characters/#{character_id}/assets/", headers: headers, params: params)
      end

      # Return a list of the corporation assets.
      #
      # This endpoint is cached for up to 3600 seconds.
      #
      # This endpoint requires authorization (see {ESI::Client#authorize}).
      #
      # @esi_scope esi-assets.read_corporation_assets.v1
      #
      # @esi_version dev
      # @esi_version v5
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
      # @see https://esi.evetech.net/ui/#/Assets/get_corporations_corporation_id_assets
      def get_corporation_assets(corporation_id:, headers: {}, params: {})
        responses = get_corporation_assets_raw(corporation_id: corporation_id, headers: headers, params: params)
        responses.map(&:json).reduce([], :concat)
      end
      alias get_corporations_corporation_id_assets get_corporation_assets

      # Return a list of the corporation assets.
      #
      # This endpoint is cached for up to 3600 seconds.
      #
      # This endpoint requires authorization (see {ESI::Client#authorize}).
      #
      # @esi_scope esi-assets.read_corporation_assets.v1
      #
      # @esi_version dev
      # @esi_version v5
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
      # @see https://esi.evetech.net/ui/#/Assets/get_corporations_corporation_id_assets
      def get_corporation_assets_raw(corporation_id:, headers: {}, params: {})
        get("/corporations/#{corporation_id}/assets/", headers: headers, params: params)
      end

      # Return locations for a set of item ids, which you can get from character assets endpoint. Coordinates for items in hangars or stations are set to (0,0,0).
      #
      # This endpoint requires authorization (see {ESI::Client#authorize}).
      #
      # @esi_scope esi-assets.read_assets.v1
      #
      # @esi_version dev
      # @esi_version v2
      #
      # @param character_id [Integer] An EVE character ID
      # @param item_ids [Array] A list of item ids
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
      # @see https://esi.evetech.net/ui/#/Assets/post_characters_character_id_assets_locations
      def post_character_asset_locations(character_id:, item_ids:, headers: {}, params: {})
        post_character_asset_locations_raw(character_id: character_id, item_ids: item_ids, headers: headers, params: params).json
      end
      alias post_characters_character_id_assets_locations post_character_asset_locations

      # Return locations for a set of item ids, which you can get from character assets endpoint. Coordinates for items in hangars or stations are set to (0,0,0).
      #
      # This endpoint requires authorization (see {ESI::Client#authorize}).
      #
      # @esi_scope esi-assets.read_assets.v1
      #
      # @esi_version dev
      # @esi_version v2
      #
      # @param character_id [Integer] An EVE character ID
      # @param item_ids [Array] A list of item ids
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
      # @see https://esi.evetech.net/ui/#/Assets/post_characters_character_id_assets_locations
      def post_character_asset_locations_raw(character_id:, item_ids:, headers: {}, params: {})
        post("/characters/#{character_id}/assets/locations/", headers: headers, params: params, payload: item_ids)
      end

      # Return names for a set of item ids, which you can get from character assets endpoint. Typically used for items that can customize names, like containers or ships.
      #
      # This endpoint requires authorization (see {ESI::Client#authorize}).
      #
      # @esi_scope esi-assets.read_assets.v1
      #
      # @esi_version dev
      # @esi_version legacy
      # @esi_version v1
      #
      # @param character_id [Integer] An EVE character ID
      # @param item_ids [Array] A list of item ids
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
      # @see https://esi.evetech.net/ui/#/Assets/post_characters_character_id_assets_names
      def post_character_asset_names(character_id:, item_ids:, headers: {}, params: {})
        post_character_asset_names_raw(character_id: character_id, item_ids: item_ids, headers: headers, params: params).json
      end
      alias post_characters_character_id_assets_names post_character_asset_names

      # Return names for a set of item ids, which you can get from character assets endpoint. Typically used for items that can customize names, like containers or ships.
      #
      # This endpoint requires authorization (see {ESI::Client#authorize}).
      #
      # @esi_scope esi-assets.read_assets.v1
      #
      # @esi_version dev
      # @esi_version legacy
      # @esi_version v1
      #
      # @param character_id [Integer] An EVE character ID
      # @param item_ids [Array] A list of item ids
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
      # @see https://esi.evetech.net/ui/#/Assets/post_characters_character_id_assets_names
      def post_character_asset_names_raw(character_id:, item_ids:, headers: {}, params: {})
        post("/characters/#{character_id}/assets/names/", headers: headers, params: params, payload: item_ids)
      end

      # Return locations for a set of item ids, which you can get from corporation assets endpoint. Coordinates for items in hangars or stations are set to (0,0,0).
      #
      # This endpoint requires authorization (see {ESI::Client#authorize}).
      #
      # @esi_scope esi-assets.read_corporation_assets.v1
      #
      # @esi_version dev
      # @esi_version v2
      #
      # @param corporation_id [Integer] An EVE corporation ID
      # @param item_ids [Array] A list of item ids
      # @param params [Hash] Additional query string parameters
      # @param headers [Hash] Additional headers
      #
      # @raise [ESI::Errors::BadRequestError] Bad request
      # @raise [ESI::Errors::UnauthorizedError] Unauthorized
      # @raise [ESI::Errors::ForbiddenError] Forbidden
      # @raise [ESI::Errors::NotFoundError] Invalid IDs
      # @raise [ESI::Errors::ErrorLimitedError] Error limited
      # @raise [ESI::Errors::InternalServerError] Internal server error
      # @raise [ESI::Errors::ServiceUnavailableError] Service unavailable
      # @raise [ESI::Errors::GatewayTimeoutError] Gateway timeout
      #
      # @see https://esi.evetech.net/ui/#/Assets/post_corporations_corporation_id_assets_locations
      def post_corporation_asset_locations(corporation_id:, item_ids:, headers: {}, params: {})
        post_corporation_asset_locations_raw(corporation_id: corporation_id, item_ids: item_ids, headers: headers, params: params).json
      end
      alias post_corporations_corporation_id_assets_locations post_corporation_asset_locations

      # Return locations for a set of item ids, which you can get from corporation assets endpoint. Coordinates for items in hangars or stations are set to (0,0,0).
      #
      # This endpoint requires authorization (see {ESI::Client#authorize}).
      #
      # @esi_scope esi-assets.read_corporation_assets.v1
      #
      # @esi_version dev
      # @esi_version v2
      #
      # @param corporation_id [Integer] An EVE corporation ID
      # @param item_ids [Array] A list of item ids
      # @param params [Hash] Additional query string parameters
      # @param headers [Hash] Additional headers
      #
      # @raise [ESI::Errors::BadRequestError] Bad request
      # @raise [ESI::Errors::UnauthorizedError] Unauthorized
      # @raise [ESI::Errors::ForbiddenError] Forbidden
      # @raise [ESI::Errors::NotFoundError] Invalid IDs
      # @raise [ESI::Errors::ErrorLimitedError] Error limited
      # @raise [ESI::Errors::InternalServerError] Internal server error
      # @raise [ESI::Errors::ServiceUnavailableError] Service unavailable
      # @raise [ESI::Errors::GatewayTimeoutError] Gateway timeout
      #
      # @see https://esi.evetech.net/ui/#/Assets/post_corporations_corporation_id_assets_locations
      def post_corporation_asset_locations_raw(corporation_id:, item_ids:, headers: {}, params: {})
        post("/corporations/#{corporation_id}/assets/locations/", headers: headers, params: params, payload: item_ids)
      end

      # Return names for a set of item ids, which you can get from corporation assets endpoint. Only valid for items that can customize names, like containers or ships.
      #
      # This endpoint requires authorization (see {ESI::Client#authorize}).
      #
      # @esi_scope esi-assets.read_corporation_assets.v1
      #
      # @esi_version dev
      # @esi_version legacy
      # @esi_version v1
      #
      # @param corporation_id [Integer] An EVE corporation ID
      # @param item_ids [Array] A list of item ids
      # @param params [Hash] Additional query string parameters
      # @param headers [Hash] Additional headers
      #
      # @raise [ESI::Errors::BadRequestError] Bad request
      # @raise [ESI::Errors::UnauthorizedError] Unauthorized
      # @raise [ESI::Errors::ForbiddenError] Forbidden
      # @raise [ESI::Errors::NotFoundError] Invalid IDs
      # @raise [ESI::Errors::ErrorLimitedError] Error limited
      # @raise [ESI::Errors::InternalServerError] Internal server error
      # @raise [ESI::Errors::ServiceUnavailableError] Service unavailable
      # @raise [ESI::Errors::GatewayTimeoutError] Gateway timeout
      #
      # @see https://esi.evetech.net/ui/#/Assets/post_corporations_corporation_id_assets_names
      def post_corporation_asset_names(corporation_id:, item_ids:, headers: {}, params: {})
        post_corporation_asset_names_raw(corporation_id: corporation_id, item_ids: item_ids, headers: headers, params: params).json
      end
      alias post_corporations_corporation_id_assets_names post_corporation_asset_names

      # Return names for a set of item ids, which you can get from corporation assets endpoint. Only valid for items that can customize names, like containers or ships.
      #
      # This endpoint requires authorization (see {ESI::Client#authorize}).
      #
      # @esi_scope esi-assets.read_corporation_assets.v1
      #
      # @esi_version dev
      # @esi_version legacy
      # @esi_version v1
      #
      # @param corporation_id [Integer] An EVE corporation ID
      # @param item_ids [Array] A list of item ids
      # @param params [Hash] Additional query string parameters
      # @param headers [Hash] Additional headers
      #
      # @raise [ESI::Errors::BadRequestError] Bad request
      # @raise [ESI::Errors::UnauthorizedError] Unauthorized
      # @raise [ESI::Errors::ForbiddenError] Forbidden
      # @raise [ESI::Errors::NotFoundError] Invalid IDs
      # @raise [ESI::Errors::ErrorLimitedError] Error limited
      # @raise [ESI::Errors::InternalServerError] Internal server error
      # @raise [ESI::Errors::ServiceUnavailableError] Service unavailable
      # @raise [ESI::Errors::GatewayTimeoutError] Gateway timeout
      #
      # @see https://esi.evetech.net/ui/#/Assets/post_corporations_corporation_id_assets_names
      def post_corporation_asset_names_raw(corporation_id:, item_ids:, headers: {}, params: {})
        post("/corporations/#{corporation_id}/assets/names/", headers: headers, params: params, payload: item_ids)
      end
    end
  end
end
