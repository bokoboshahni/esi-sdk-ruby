# frozen_string_literal: true

module ESI
  class Client
    # ESI wallet operations.
    module Wallet
      # Returns a character's wallet balance.
      #
      # This endpoint is cached for up to 120 seconds.
      #
      # This endpoint requires authorization (see {ESI::Client#authorize}).
      #
      # @esi_scope esi-wallet.read_character_wallet.v1
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
      # @raise [ESI::Errors::ErrorLimitedError] Error limited
      # @raise [ESI::Errors::InternalServerError] Internal server error
      # @raise [ESI::Errors::ServiceUnavailableError] Service unavailable
      # @raise [ESI::Errors::GatewayTimeoutError] Gateway timeout
      #
      # @see https://esi.evetech.net/ui/#/Wallet/get_characters_character_id_wallet
      def get_character_wallet(character_id:, headers: {}, params: {})
        get_character_wallet_raw(character_id: character_id, headers: headers, params: params).json
      end
      alias get_characters_character_id_wallet get_character_wallet

      # Returns a character's wallet balance.
      #
      # This endpoint is cached for up to 120 seconds.
      #
      # This endpoint requires authorization (see {ESI::Client#authorize}).
      #
      # @esi_scope esi-wallet.read_character_wallet.v1
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
      # @raise [ESI::Errors::ErrorLimitedError] Error limited
      # @raise [ESI::Errors::InternalServerError] Internal server error
      # @raise [ESI::Errors::ServiceUnavailableError] Service unavailable
      # @raise [ESI::Errors::GatewayTimeoutError] Gateway timeout
      #
      # @see https://esi.evetech.net/ui/#/Wallet/get_characters_character_id_wallet
      def get_character_wallet_raw(character_id:, headers: {}, params: {})
        get("/characters/#{character_id}/wallet/", headers: headers, params: params)
      end

      # Retrieve the given character's wallet journal going 30 days back.
      #
      # This endpoint is cached for up to 3600 seconds.
      #
      # This endpoint requires authorization (see {ESI::Client#authorize}).
      #
      # @esi_scope esi-wallet.read_character_wallet.v1
      #
      # @esi_version dev
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
      # @see https://esi.evetech.net/ui/#/Wallet/get_characters_character_id_wallet_journal
      def get_character_wallet_journal(character_id:, headers: {}, params: {})
        concat_responses(get_character_wallet_journal_raw(character_id: character_id, headers: headers, params: params))
      end
      alias get_characters_character_id_wallet_journal get_character_wallet_journal

      # Retrieve the given character's wallet journal going 30 days back.
      #
      # This endpoint is cached for up to 3600 seconds.
      #
      # This endpoint requires authorization (see {ESI::Client#authorize}).
      #
      # @esi_scope esi-wallet.read_character_wallet.v1
      #
      # @esi_version dev
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
      # @see https://esi.evetech.net/ui/#/Wallet/get_characters_character_id_wallet_journal
      def get_character_wallet_journal_raw(character_id:, headers: {}, params: {})
        get("/characters/#{character_id}/wallet/journal/", headers: headers, params: params)
      end

      # Get wallet transactions of a character.
      #
      # This endpoint is cached for up to 3600 seconds.
      #
      # This endpoint requires authorization (see {ESI::Client#authorize}).
      #
      # @esi_scope esi-wallet.read_character_wallet.v1
      #
      # @esi_version dev
      # @esi_version legacy
      # @esi_version v1
      #
      # @param character_id [Integer] An EVE character ID
      # @param from_id [Integer] Only show transactions happened before the one referenced by this id
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
      # @see https://esi.evetech.net/ui/#/Wallet/get_characters_character_id_wallet_transactions
      def get_character_wallet_transactions(character_id:, from_id: nil, headers: {}, params: {})
        get_character_wallet_transactions_raw(character_id: character_id, from_id: from_id, headers: headers, params: params).json
      end
      alias get_characters_character_id_wallet_transactions get_character_wallet_transactions

      # Get wallet transactions of a character.
      #
      # This endpoint is cached for up to 3600 seconds.
      #
      # This endpoint requires authorization (see {ESI::Client#authorize}).
      #
      # @esi_scope esi-wallet.read_character_wallet.v1
      #
      # @esi_version dev
      # @esi_version legacy
      # @esi_version v1
      #
      # @param character_id [Integer] An EVE character ID
      # @param from_id [Integer] Only show transactions happened before the one referenced by this id
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
      # @see https://esi.evetech.net/ui/#/Wallet/get_characters_character_id_wallet_transactions
      def get_character_wallet_transactions_raw(character_id:, from_id: nil, headers: {}, params: {})
        params.merge!("from_id" => from_id)
        get("/characters/#{character_id}/wallet/transactions/", headers: headers, params: params)
      end

      # Get a corporation's wallets.
      #
      # This endpoint is cached for up to 300 seconds.
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
      # @see https://esi.evetech.net/ui/#/Wallet/get_corporations_corporation_id_wallets
      def get_corporation_wallets(corporation_id:, headers: {}, params: {})
        get_corporation_wallets_raw(corporation_id: corporation_id, headers: headers, params: params).json
      end
      alias get_corporations_corporation_id_wallets get_corporation_wallets

      # Get a corporation's wallets.
      #
      # This endpoint is cached for up to 300 seconds.
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
      # @see https://esi.evetech.net/ui/#/Wallet/get_corporations_corporation_id_wallets
      def get_corporation_wallets_raw(corporation_id:, headers: {}, params: {})
        get("/corporations/#{corporation_id}/wallets/", headers: headers, params: params)
      end

      # Retrieve the given corporation's wallet journal for the given division going 30 days back.
      #
      # This endpoint is cached for up to 3600 seconds.
      #
      # This endpoint requires authorization (see {ESI::Client#authorize}).
      #
      # @esi_scope esi-wallet.read_corporation_wallets.v1
      #
      # @esi_version dev
      # @esi_version v4
      #
      # @param corporation_id [Integer] An EVE corporation ID
      # @param division [Integer] Wallet key of the division to fetch journals from
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
      # @see https://esi.evetech.net/ui/#/Wallet/get_corporations_corporation_id_wallets_division_journal
      def get_corporation_wallets_division_journal(corporation_id:, division:, headers: {}, params: {})
        concat_responses(get_corporation_wallets_division_journal_raw(corporation_id: corporation_id, division: division, headers: headers, params: params))
      end
      alias get_corporations_corporation_id_wallets_division_journal get_corporation_wallets_division_journal

      # Retrieve the given corporation's wallet journal for the given division going 30 days back.
      #
      # This endpoint is cached for up to 3600 seconds.
      #
      # This endpoint requires authorization (see {ESI::Client#authorize}).
      #
      # @esi_scope esi-wallet.read_corporation_wallets.v1
      #
      # @esi_version dev
      # @esi_version v4
      #
      # @param corporation_id [Integer] An EVE corporation ID
      # @param division [Integer] Wallet key of the division to fetch journals from
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
      # @see https://esi.evetech.net/ui/#/Wallet/get_corporations_corporation_id_wallets_division_journal
      def get_corporation_wallets_division_journal_raw(corporation_id:, division:, headers: {}, params: {})
        get("/corporations/#{corporation_id}/wallets/#{division}/journal/", headers: headers, params: params)
      end

      # Get wallet transactions of a corporation.
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
      # @param division [Integer] Wallet key of the division to fetch journals from
      # @param from_id [Integer] Only show journal entries happened before the transaction referenced by this id
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
      # @see https://esi.evetech.net/ui/#/Wallet/get_corporations_corporation_id_wallets_division_transactions
      def get_corporation_wallets_division_transactions(corporation_id:, division:, from_id: nil, headers: {}, params: {})
        get_corporation_wallets_division_transactions_raw(corporation_id: corporation_id, division: division, from_id: from_id, headers: headers, params: params).json
      end
      alias get_corporations_corporation_id_wallets_division_transactions get_corporation_wallets_division_transactions

      # Get wallet transactions of a corporation.
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
      # @param division [Integer] Wallet key of the division to fetch journals from
      # @param from_id [Integer] Only show journal entries happened before the transaction referenced by this id
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
      # @see https://esi.evetech.net/ui/#/Wallet/get_corporations_corporation_id_wallets_division_transactions
      def get_corporation_wallets_division_transactions_raw(corporation_id:, division:, from_id: nil, headers: {}, params: {})
        params.merge!("from_id" => from_id)
        get("/corporations/#{corporation_id}/wallets/#{division}/transactions/", headers: headers, params: params)
      end
    end
  end
end
