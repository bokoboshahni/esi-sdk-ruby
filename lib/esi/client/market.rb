# frozen_string_literal: true

module ESI
  class Client
    # ESI market operations.
    module Market
      # List open market orders placed by a character.
      #
      # This endpoint is cached for up to 1200 seconds.
      #
      # This endpoint requires authorization (see {ESI::Client#authorize}).
      #
      # @esi_scope esi-markets.read_character_orders.v1
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
      # @see https://esi.evetech.net/ui/#/Market/get_characters_character_id_orders
      def get_character_orders(character_id:, headers: {}, params: {})
        get_character_orders_raw(character_id: character_id, headers: headers, params: params).json
      end
      alias get_characters_character_id_orders get_character_orders

      # List open market orders placed by a character.
      #
      # This endpoint is cached for up to 1200 seconds.
      #
      # This endpoint requires authorization (see {ESI::Client#authorize}).
      #
      # @esi_scope esi-markets.read_character_orders.v1
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
      # @see https://esi.evetech.net/ui/#/Market/get_characters_character_id_orders
      def get_character_orders_raw(character_id:, headers: {}, params: {})
        get("/characters/#{character_id}/orders/", headers: headers, params: params)
      end

      # List cancelled and expired market orders placed by a character up to 90 days in the past.
      #
      # This endpoint is cached for up to 3600 seconds.
      #
      # This endpoint requires authorization (see {ESI::Client#authorize}).
      #
      # @esi_scope esi-markets.read_character_orders.v1
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
      # @see https://esi.evetech.net/ui/#/Market/get_characters_character_id_orders_history
      def get_character_orders_history(character_id:, headers: {}, params: {})
        concat_responses(get_character_orders_history_raw(character_id: character_id, headers: headers, params: params))
      end
      alias get_characters_character_id_orders_history get_character_orders_history

      # List cancelled and expired market orders placed by a character up to 90 days in the past.
      #
      # This endpoint is cached for up to 3600 seconds.
      #
      # This endpoint requires authorization (see {ESI::Client#authorize}).
      #
      # @esi_scope esi-markets.read_character_orders.v1
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
      # @see https://esi.evetech.net/ui/#/Market/get_characters_character_id_orders_history
      def get_character_orders_history_raw(character_id:, headers: {}, params: {})
        get("/characters/#{character_id}/orders/history/", headers: headers, params: params)
      end

      # List open market orders placed on behalf of a corporation.
      #
      # This endpoint is cached for up to 1200 seconds.
      #
      # This endpoint requires authorization (see {ESI::Client#authorize}).
      #
      # @esi_scope esi-markets.read_corporation_orders.v1
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
      # @see https://esi.evetech.net/ui/#/Market/get_corporations_corporation_id_orders
      def get_corporation_orders(corporation_id:, headers: {}, params: {})
        concat_responses(get_corporation_orders_raw(corporation_id: corporation_id, headers: headers, params: params))
      end
      alias get_corporations_corporation_id_orders get_corporation_orders

      # List open market orders placed on behalf of a corporation.
      #
      # This endpoint is cached for up to 1200 seconds.
      #
      # This endpoint requires authorization (see {ESI::Client#authorize}).
      #
      # @esi_scope esi-markets.read_corporation_orders.v1
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
      # @see https://esi.evetech.net/ui/#/Market/get_corporations_corporation_id_orders
      def get_corporation_orders_raw(corporation_id:, headers: {}, params: {})
        get("/corporations/#{corporation_id}/orders/", headers: headers, params: params)
      end

      # List cancelled and expired market orders placed on behalf of a corporation up to 90 days in the past.
      #
      # This endpoint is cached for up to 3600 seconds.
      #
      # This endpoint requires authorization (see {ESI::Client#authorize}).
      #
      # @esi_scope esi-markets.read_corporation_orders.v1
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
      # @see https://esi.evetech.net/ui/#/Market/get_corporations_corporation_id_orders_history
      def get_corporation_orders_history(corporation_id:, headers: {}, params: {})
        concat_responses(get_corporation_orders_history_raw(corporation_id: corporation_id, headers: headers, params: params))
      end
      alias get_corporations_corporation_id_orders_history get_corporation_orders_history

      # List cancelled and expired market orders placed on behalf of a corporation up to 90 days in the past.
      #
      # This endpoint is cached for up to 3600 seconds.
      #
      # This endpoint requires authorization (see {ESI::Client#authorize}).
      #
      # @esi_scope esi-markets.read_corporation_orders.v1
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
      # @see https://esi.evetech.net/ui/#/Market/get_corporations_corporation_id_orders_history
      def get_corporation_orders_history_raw(corporation_id:, headers: {}, params: {})
        get("/corporations/#{corporation_id}/orders/history/", headers: headers, params: params)
      end

      # Get a list of item groups.
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
      # @see https://esi.evetech.net/ui/#/Market/get_markets_groups
      def get_market_groups(headers: {}, params: {})
        get_market_groups_raw(headers: headers, params: params).json
      end
      alias get_markets_groups get_market_groups

      # Get a list of item groups.
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
      # @see https://esi.evetech.net/ui/#/Market/get_markets_groups
      def get_market_groups_raw(headers: {}, params: {})
        get("/markets/groups/", headers: headers, params: params)
      end

      # Get information on an item group.
      #
      # @esi_version dev
      # @esi_version legacy
      # @esi_version v1
      #
      # @param market_group_id [Integer] An Eve item group ID
      # @param params [Hash] Additional query string parameters
      # @param headers [Hash] Additional headers
      #
      # @raise [ESI::Errors::BadRequestError] Bad request
      # @raise [ESI::Errors::NotFoundError] Market group not found
      # @raise [ESI::Errors::ErrorLimitedError] Error limited
      # @raise [ESI::Errors::InternalServerError] Internal server error
      # @raise [ESI::Errors::ServiceUnavailableError] Service unavailable
      # @raise [ESI::Errors::GatewayTimeoutError] Gateway timeout
      #
      # @see https://esi.evetech.net/ui/#/Market/get_markets_groups_market_group_id
      def get_market_groups_market_group(market_group_id:, headers: {}, params: {})
        get_market_groups_market_group_raw(market_group_id: market_group_id, headers: headers, params: params).json
      end
      alias get_markets_groups_market_group_id get_market_groups_market_group

      # Get information on an item group.
      #
      # @esi_version dev
      # @esi_version legacy
      # @esi_version v1
      #
      # @param market_group_id [Integer] An Eve item group ID
      # @param params [Hash] Additional query string parameters
      # @param headers [Hash] Additional headers
      #
      # @raise [ESI::Errors::BadRequestError] Bad request
      # @raise [ESI::Errors::NotFoundError] Market group not found
      # @raise [ESI::Errors::ErrorLimitedError] Error limited
      # @raise [ESI::Errors::InternalServerError] Internal server error
      # @raise [ESI::Errors::ServiceUnavailableError] Service unavailable
      # @raise [ESI::Errors::GatewayTimeoutError] Gateway timeout
      #
      # @see https://esi.evetech.net/ui/#/Market/get_markets_groups_market_group_id
      def get_market_groups_market_group_raw(market_group_id:, headers: {}, params: {})
        get("/markets/groups/#{market_group_id}/", headers: headers, params: params)
      end

      # Return a list of prices.
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
      # @see https://esi.evetech.net/ui/#/Market/get_markets_prices
      def get_market_prices(headers: {}, params: {})
        get_market_prices_raw(headers: headers, params: params).json
      end
      alias get_markets_prices get_market_prices

      # Return a list of prices.
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
      # @see https://esi.evetech.net/ui/#/Market/get_markets_prices
      def get_market_prices_raw(headers: {}, params: {})
        get("/markets/prices/", headers: headers, params: params)
      end

      # Return a list of historical market statistics for the specified type in a region.
      #
      # @esi_version dev
      # @esi_version legacy
      # @esi_version v1
      #
      # @param region_id [Integer] Return statistics in this region
      # @param type_id [Integer] Return statistics for this type
      # @param params [Hash] Additional query string parameters
      # @param headers [Hash] Additional headers
      #
      # @raise [ESI::Errors::BadRequestError] Bad request
      # @raise [ESI::Errors::NotFoundError] Type not found
      # @raise [ESI::Errors::ErrorLimitedError] Error limited
      # @raise [ESI::Errors::UnprocessableEntityError] Not found
      # @raise [ESI::Errors::InternalServerError] Internal server error
      # @raise [ESI::Errors::ServiceUnavailableError] Service unavailable
      # @raise [ESI::Errors::GatewayTimeoutError] Gateway timeout
      # @raise [ESI::Errors::EveServerError] Internal error thrown from the EVE server
      #
      # @see https://esi.evetech.net/ui/#/Market/get_markets_region_id_history
      def get_markets_region_history(region_id:, type_id:, headers: {}, params: {})
        get_markets_region_history_raw(region_id: region_id, type_id: type_id, headers: headers, params: params).json
      end
      alias get_markets_region_id_history get_markets_region_history

      # Return a list of historical market statistics for the specified type in a region.
      #
      # @esi_version dev
      # @esi_version legacy
      # @esi_version v1
      #
      # @param region_id [Integer] Return statistics in this region
      # @param type_id [Integer] Return statistics for this type
      # @param params [Hash] Additional query string parameters
      # @param headers [Hash] Additional headers
      #
      # @raise [ESI::Errors::BadRequestError] Bad request
      # @raise [ESI::Errors::NotFoundError] Type not found
      # @raise [ESI::Errors::ErrorLimitedError] Error limited
      # @raise [ESI::Errors::UnprocessableEntityError] Not found
      # @raise [ESI::Errors::InternalServerError] Internal server error
      # @raise [ESI::Errors::ServiceUnavailableError] Service unavailable
      # @raise [ESI::Errors::GatewayTimeoutError] Gateway timeout
      # @raise [ESI::Errors::EveServerError] Internal error thrown from the EVE server
      #
      # @see https://esi.evetech.net/ui/#/Market/get_markets_region_id_history
      def get_markets_region_history_raw(region_id:, type_id:, headers: {}, params: {})
        params.merge!("type_id" => type_id)
        get("/markets/#{region_id}/history/", headers: headers, params: params)
      end

      # Return a list of orders in a region.
      #
      # This endpoint is cached for up to 300 seconds.
      #
      # @esi_version dev
      # @esi_version legacy
      # @esi_version v1
      #
      # @param region_id [Integer] Return orders in this region
      # @param order_type [String] Filter buy/sell orders, return all orders by default. If you query without type_id, we always return both buy and sell orders. Must be one of: `buy`, `sell`, `all`
      # @param type_id [Integer] Return orders only for this type
      # @param params [Hash] Additional query string parameters
      # @param headers [Hash] Additional headers
      #
      # @raise [ESI::Errors::BadRequestError] Bad request
      # @raise [ESI::Errors::NotFoundError] Not found
      # @raise [ESI::Errors::ErrorLimitedError] Error limited
      # @raise [ESI::Errors::UnprocessableEntityError] Not found
      # @raise [ESI::Errors::InternalServerError] Internal server error
      # @raise [ESI::Errors::ServiceUnavailableError] Service unavailable
      # @raise [ESI::Errors::GatewayTimeoutError] Gateway timeout
      #
      # @see https://esi.evetech.net/ui/#/Market/get_markets_region_id_orders
      def get_markets_region_orders(region_id:, order_type: "all", type_id: nil, headers: {}, params: {})
        params.merge!("order_type" => order_type, "type_id" => type_id)
        concat_responses(get_markets_region_orders_raw(region_id: region_id, order_type: order_type, type_id: type_id, headers: headers, params: params))
      end
      alias get_markets_region_id_orders get_markets_region_orders

      # Return a list of orders in a region.
      #
      # This endpoint is cached for up to 300 seconds.
      #
      # @esi_version dev
      # @esi_version legacy
      # @esi_version v1
      #
      # @param region_id [Integer] Return orders in this region
      # @param order_type [String] Filter buy/sell orders, return all orders by default. If you query without type_id, we always return both buy and sell orders. Must be one of: `buy`, `sell`, `all`
      # @param type_id [Integer] Return orders only for this type
      # @param params [Hash] Additional query string parameters
      # @param headers [Hash] Additional headers
      #
      # @raise [ESI::Errors::BadRequestError] Bad request
      # @raise [ESI::Errors::NotFoundError] Not found
      # @raise [ESI::Errors::ErrorLimitedError] Error limited
      # @raise [ESI::Errors::UnprocessableEntityError] Not found
      # @raise [ESI::Errors::InternalServerError] Internal server error
      # @raise [ESI::Errors::ServiceUnavailableError] Service unavailable
      # @raise [ESI::Errors::GatewayTimeoutError] Gateway timeout
      #
      # @see https://esi.evetech.net/ui/#/Market/get_markets_region_id_orders
      def get_markets_region_orders_raw(region_id:, order_type: "all", type_id: nil, headers: {}, params: {})
        params.merge!("order_type" => order_type, "type_id" => type_id)
        get("/markets/#{region_id}/orders/", headers: headers, params: params)
      end

      # Return a list of type IDs that have active orders in the region, for efficient market indexing.
      #
      # This endpoint is cached for up to 600 seconds.
      #
      # @esi_version dev
      # @esi_version legacy
      # @esi_version v1
      #
      # @param region_id [Integer] Return statistics in this region
      # @param params [Hash] Additional query string parameters
      # @param headers [Hash] Additional headers
      #
      # @raise [ESI::Errors::BadRequestError] Bad request
      # @raise [ESI::Errors::ErrorLimitedError] Error limited
      # @raise [ESI::Errors::InternalServerError] Internal server error
      # @raise [ESI::Errors::ServiceUnavailableError] Service unavailable
      # @raise [ESI::Errors::GatewayTimeoutError] Gateway timeout
      #
      # @see https://esi.evetech.net/ui/#/Market/get_markets_region_id_types
      def get_markets_region_types(region_id:, headers: {}, params: {})
        concat_responses(get_markets_region_types_raw(region_id: region_id, headers: headers, params: params))
      end
      alias get_markets_region_id_types get_markets_region_types

      # Return a list of type IDs that have active orders in the region, for efficient market indexing.
      #
      # This endpoint is cached for up to 600 seconds.
      #
      # @esi_version dev
      # @esi_version legacy
      # @esi_version v1
      #
      # @param region_id [Integer] Return statistics in this region
      # @param params [Hash] Additional query string parameters
      # @param headers [Hash] Additional headers
      #
      # @raise [ESI::Errors::BadRequestError] Bad request
      # @raise [ESI::Errors::ErrorLimitedError] Error limited
      # @raise [ESI::Errors::InternalServerError] Internal server error
      # @raise [ESI::Errors::ServiceUnavailableError] Service unavailable
      # @raise [ESI::Errors::GatewayTimeoutError] Gateway timeout
      #
      # @see https://esi.evetech.net/ui/#/Market/get_markets_region_id_types
      def get_markets_region_types_raw(region_id:, headers: {}, params: {})
        get("/markets/#{region_id}/types/", headers: headers, params: params)
      end

      # Return all orders in a structure.
      #
      # This endpoint is cached for up to 300 seconds.
      #
      # This endpoint requires authorization (see {ESI::Client#authorize}).
      #
      # @esi_scope esi-markets.structure_markets.v1
      #
      # @esi_version dev
      # @esi_version legacy
      # @esi_version v1
      #
      # @param structure_id [Integer] Return orders in this structure
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
      # @see https://esi.evetech.net/ui/#/Market/get_markets_structures_structure_id
      def get_markets_structure(structure_id:, headers: {}, params: {})
        concat_responses(get_markets_structure_raw(structure_id: structure_id, headers: headers, params: params))
      end
      alias get_markets_structures_structure_id get_markets_structure

      # Return all orders in a structure.
      #
      # This endpoint is cached for up to 300 seconds.
      #
      # This endpoint requires authorization (see {ESI::Client#authorize}).
      #
      # @esi_scope esi-markets.structure_markets.v1
      #
      # @esi_version dev
      # @esi_version legacy
      # @esi_version v1
      #
      # @param structure_id [Integer] Return orders in this structure
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
      # @see https://esi.evetech.net/ui/#/Market/get_markets_structures_structure_id
      def get_markets_structure_raw(structure_id:, headers: {}, params: {})
        get("/markets/structures/#{structure_id}/", headers: headers, params: params)
      end
    end
  end
end
