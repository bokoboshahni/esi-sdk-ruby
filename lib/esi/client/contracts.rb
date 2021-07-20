# frozen_string_literal: true

module ESI
  class Client
    # ESI contracts operations.
    module Contract
      # Lists bids on a particular auction contract.
      #
      # This endpoint is cached for up to 300 seconds.
      #
      # This endpoint requires authorization (see {ESI::Client#authorize}).
      #
      # @esi_scope esi-contracts.read_character_contracts.v1
      #
      # @esi_version dev
      # @esi_version legacy
      # @esi_version v1
      #
      # @param character_id [Integer] An EVE character ID
      # @param contract_id [Integer] ID of a contract
      # @param params [Hash] Additional query string parameters
      # @param headers [Hash] Additional headers
      #
      # @raise [ESI::Errors::BadRequestError] Bad request
      # @raise [ESI::Errors::UnauthorizedError] Unauthorized
      # @raise [ESI::Errors::ForbiddenError] Forbidden
      # @raise [ESI::Errors::NotFoundError] Not found
      # @raise [ESI::Errors::ErrorLimitedError] Error limited
      # @raise [ESI::Errors::InternalServerError] Internal server error
      # @raise [ESI::Errors::ServiceUnavailableError] Service unavailable
      # @raise [ESI::Errors::GatewayTimeoutError] Gateway timeout
      #
      # @see https://esi.evetech.net/ui/#/Contracts/get_characters_character_id_contracts_contract_id_bids
      def get_character_contract_bids(character_id:, contract_id:, headers: {}, params: {})
        get("/characters/#{character_id}/contracts/#{contract_id}/bids/", headers: headers, params: params)
      end
      alias get_characters_character_id_contracts_contract_id_bids get_character_contract_bids

      # Lists items of a particular contract.
      #
      # This endpoint is cached for up to 3600 seconds.
      #
      # This endpoint requires authorization (see {ESI::Client#authorize}).
      #
      # @esi_scope esi-contracts.read_character_contracts.v1
      #
      # @esi_version dev
      # @esi_version legacy
      # @esi_version v1
      #
      # @param character_id [Integer] An EVE character ID
      # @param contract_id [Integer] ID of a contract
      # @param params [Hash] Additional query string parameters
      # @param headers [Hash] Additional headers
      #
      # @raise [ESI::Errors::BadRequestError] Bad request
      # @raise [ESI::Errors::UnauthorizedError] Unauthorized
      # @raise [ESI::Errors::ForbiddenError] Forbidden
      # @raise [ESI::Errors::NotFoundError] Not found
      # @raise [ESI::Errors::ErrorLimitedError] Error limited
      # @raise [ESI::Errors::InternalServerError] Internal server error
      # @raise [ESI::Errors::ServiceUnavailableError] Service unavailable
      # @raise [ESI::Errors::GatewayTimeoutError] Gateway timeout
      #
      # @see https://esi.evetech.net/ui/#/Contracts/get_characters_character_id_contracts_contract_id_items
      def get_character_contract_items(character_id:, contract_id:, headers: {}, params: {})
        get("/characters/#{character_id}/contracts/#{contract_id}/items/", headers: headers, params: params)
      end
      alias get_characters_character_id_contracts_contract_id_items get_character_contract_items

      # Returns contracts available to a character, only if the character is issuer, acceptor or assignee. Only returns contracts no older than 30 days, or if the status is "in_progress".
      #
      # This endpoint is cached for up to 300 seconds.
      #
      # This endpoint requires authorization (see {ESI::Client#authorize}).
      #
      # @esi_scope esi-contracts.read_character_contracts.v1
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
      # @see https://esi.evetech.net/ui/#/Contracts/get_characters_character_id_contracts
      def get_character_contracts(character_id:, headers: {}, params: {})
        get("/characters/#{character_id}/contracts/", headers: headers, params: params)
      end
      alias get_characters_character_id_contracts get_character_contracts

      # Lists bids on a public auction contract.
      #
      # This endpoint is cached for up to 300 seconds.
      #
      # @esi_version dev
      # @esi_version legacy
      # @esi_version v1
      #
      # @param contract_id [Integer] ID of a contract
      # @param params [Hash] Additional query string parameters
      # @param headers [Hash] Additional headers
      #
      # @raise [ESI::Errors::BadRequestError] Bad request
      # @raise [ESI::Errors::ForbiddenError] Not Authorized to see contract
      # @raise [ESI::Errors::NotFoundError] Not found
      # @raise [ESI::Errors::ErrorLimitedError] Error limited
      # @raise [ESI::Errors::InternalServerError] Internal server error
      # @raise [ESI::Errors::ServiceUnavailableError] Service unavailable
      # @raise [ESI::Errors::GatewayTimeoutError] Gateway timeout
      #
      # @see https://esi.evetech.net/ui/#/Contracts/get_contracts_public_bids_contract_id
      def get_contracts_public_bids_contract(contract_id:, headers: {}, params: {})
        get("/contracts/public/bids/#{contract_id}/", headers: headers, params: params)
      end
      alias get_contracts_public_bids_contract_id get_contracts_public_bids_contract

      # Lists items of a public contract.
      #
      # This endpoint is cached for up to 3600 seconds.
      #
      # @esi_version dev
      # @esi_version legacy
      # @esi_version v1
      #
      # @param contract_id [Integer] ID of a contract
      # @param params [Hash] Additional query string parameters
      # @param headers [Hash] Additional headers
      #
      # @raise [ESI::Errors::BadRequestError] Bad request
      # @raise [ESI::Errors::ForbiddenError] Not Authorized to see contract
      # @raise [ESI::Errors::NotFoundError] Not found
      # @raise [ESI::Errors::ErrorLimitedError] Error limited
      # @raise [ESI::Errors::InternalServerError] Internal server error
      # @raise [ESI::Errors::ServiceUnavailableError] Service unavailable
      # @raise [ESI::Errors::GatewayTimeoutError] Gateway timeout
      #
      # @see https://esi.evetech.net/ui/#/Contracts/get_contracts_public_items_contract_id
      def get_contracts_public_items_contract(contract_id:, headers: {}, params: {})
        get("/contracts/public/items/#{contract_id}/", headers: headers, params: params)
      end
      alias get_contracts_public_items_contract_id get_contracts_public_items_contract

      # Returns a paginated list of all public contracts in the given region.
      #
      # This endpoint is cached for up to 1800 seconds.
      #
      # @esi_version dev
      # @esi_version legacy
      # @esi_version v1
      #
      # @param region_id [Integer] An EVE region id
      # @param params [Hash] Additional query string parameters
      # @param headers [Hash] Additional headers
      #
      # @raise [ESI::Errors::BadRequestError] Bad request
      # @raise [ESI::Errors::NotFoundError] Region not found
      # @raise [ESI::Errors::ErrorLimitedError] Error limited
      # @raise [ESI::Errors::InternalServerError] Internal server error
      # @raise [ESI::Errors::ServiceUnavailableError] Service unavailable
      # @raise [ESI::Errors::GatewayTimeoutError] Gateway timeout
      #
      # @see https://esi.evetech.net/ui/#/Contracts/get_contracts_public_region_id
      def get_contracts_public_region(region_id:, headers: {}, params: {})
        get("/contracts/public/#{region_id}/", headers: headers, params: params)
      end
      alias get_contracts_public_region_id get_contracts_public_region

      # Lists bids on a particular auction contract.
      #
      # This endpoint is cached for up to 3600 seconds.
      #
      # This endpoint requires authorization (see {ESI::Client#authorize}).
      #
      # @esi_scope esi-contracts.read_corporation_contracts.v1
      #
      # @esi_version dev
      # @esi_version legacy
      # @esi_version v1
      #
      # @param contract_id [Integer] ID of a contract
      # @param corporation_id [Integer] An EVE corporation ID
      # @param params [Hash] Additional query string parameters
      # @param headers [Hash] Additional headers
      #
      # @raise [ESI::Errors::BadRequestError] Bad request
      # @raise [ESI::Errors::UnauthorizedError] Unauthorized
      # @raise [ESI::Errors::ForbiddenError] Forbidden
      # @raise [ESI::Errors::NotFoundError] Not found
      # @raise [ESI::Errors::ErrorLimitedError] Error limited
      # @raise [ESI::Errors::InternalServerError] Internal server error
      # @raise [ESI::Errors::ServiceUnavailableError] Service unavailable
      # @raise [ESI::Errors::GatewayTimeoutError] Gateway timeout
      #
      # @see https://esi.evetech.net/ui/#/Contracts/get_corporations_corporation_id_contracts_contract_id_bids
      def get_corporation_contract_bids(contract_id:, corporation_id:, headers: {}, params: {})
        get("/corporations/#{corporation_id}/contracts/#{contract_id}/bids/", headers: headers, params: params)
      end
      alias get_corporations_corporation_id_contracts_contract_id_bids get_corporation_contract_bids

      # Lists items of a particular contract.
      #
      # This endpoint is cached for up to 3600 seconds.
      #
      # This endpoint requires authorization (see {ESI::Client#authorize}).
      #
      # @esi_scope esi-contracts.read_corporation_contracts.v1
      #
      # @esi_version dev
      # @esi_version legacy
      # @esi_version v1
      #
      # @param contract_id [Integer] ID of a contract
      # @param corporation_id [Integer] An EVE corporation ID
      # @param params [Hash] Additional query string parameters
      # @param headers [Hash] Additional headers
      #
      # @raise [ESI::Errors::BadRequestError] Bad request
      # @raise [ESI::Errors::UnauthorizedError] Unauthorized
      # @raise [ESI::Errors::ForbiddenError] Forbidden
      # @raise [ESI::Errors::NotFoundError] Not found
      # @raise [ESI::Errors::ErrorLimitedError] Error limited
      # @raise [ESI::Errors::InternalServerError] Internal server error
      # @raise [ESI::Errors::ServiceUnavailableError] Service unavailable
      # @raise [ESI::Errors::GatewayTimeoutError] Gateway timeout
      # @raise [ESI::Errors::EveServerError] Internal error thrown from the EVE server. Most of the time this means you have hit an EVE server rate limit
      #
      # @see https://esi.evetech.net/ui/#/Contracts/get_corporations_corporation_id_contracts_contract_id_items
      def get_corporation_contract_items(contract_id:, corporation_id:, headers: {}, params: {})
        get("/corporations/#{corporation_id}/contracts/#{contract_id}/items/", headers: headers, params: params)
      end
      alias get_corporations_corporation_id_contracts_contract_id_items get_corporation_contract_items

      # Returns contracts available to a corporation, only if the corporation is issuer, acceptor or assignee. Only returns contracts no older than 30 days, or if the status is "in_progress".
      #
      # This endpoint is cached for up to 300 seconds.
      #
      # This endpoint requires authorization (see {ESI::Client#authorize}).
      #
      # @esi_scope esi-contracts.read_corporation_contracts.v1
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
      # @see https://esi.evetech.net/ui/#/Contracts/get_corporations_corporation_id_contracts
      def get_corporation_contracts(corporation_id:, headers: {}, params: {})
        get("/corporations/#{corporation_id}/contracts/", headers: headers, params: params)
      end
      alias get_corporations_corporation_id_contracts get_corporation_contracts
    end
  end
end
