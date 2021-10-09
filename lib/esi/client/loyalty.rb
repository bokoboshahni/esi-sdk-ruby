# frozen_string_literal: true

module ESI
  class Client
    # ESI loyalty operations.
    module Loyalty
      # Return a list of loyalty points for all corporations the character has worked for.
      #
      # This endpoint is cached for up to 3600 seconds.
      #
      # This endpoint requires authorization (see {ESI::Client#authorize}).
      #
      # @esi_scope esi-characters.read_loyalty.v1
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
      # @see https://esi.evetech.net/ui/#/Loyalty/get_characters_character_id_loyalty_points
      def get_character_loyalty_points(character_id:, headers: {}, params: {})
        get_character_loyalty_points_raw(character_id: character_id, headers: headers, params: params).json
      end
      alias get_characters_character_id_loyalty_points get_character_loyalty_points

      # Return a list of loyalty points for all corporations the character has worked for.
      #
      # This endpoint is cached for up to 3600 seconds.
      #
      # This endpoint requires authorization (see {ESI::Client#authorize}).
      #
      # @esi_scope esi-characters.read_loyalty.v1
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
      # @see https://esi.evetech.net/ui/#/Loyalty/get_characters_character_id_loyalty_points
      def get_character_loyalty_points_raw(character_id:, headers: {}, params: {})
        get("/characters/#{character_id}/loyalty/points/", headers: headers, params: params)
      end

      # Return a list of offers from a specific corporation's loyalty store.
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
      # @raise [ESI::Errors::NotFoundError] No loyalty point store found for the provided corporation
      # @raise [ESI::Errors::ErrorLimitedError] Error limited
      # @raise [ESI::Errors::InternalServerError] Internal server error
      # @raise [ESI::Errors::ServiceUnavailableError] Service unavailable
      # @raise [ESI::Errors::GatewayTimeoutError] Gateway timeout
      #
      # @see https://esi.evetech.net/ui/#/Loyalty/get_loyalty_stores_corporation_id_offers
      def get_loyalty_stores_corporation_offers(corporation_id:, headers: {}, params: {})
        get_loyalty_stores_corporation_offers_raw(corporation_id: corporation_id, headers: headers, params: params).json
      end
      alias get_loyalty_stores_corporation_id_offers get_loyalty_stores_corporation_offers

      # Return a list of offers from a specific corporation's loyalty store.
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
      # @raise [ESI::Errors::NotFoundError] No loyalty point store found for the provided corporation
      # @raise [ESI::Errors::ErrorLimitedError] Error limited
      # @raise [ESI::Errors::InternalServerError] Internal server error
      # @raise [ESI::Errors::ServiceUnavailableError] Service unavailable
      # @raise [ESI::Errors::GatewayTimeoutError] Gateway timeout
      #
      # @see https://esi.evetech.net/ui/#/Loyalty/get_loyalty_stores_corporation_id_offers
      def get_loyalty_stores_corporation_offers_raw(corporation_id:, headers: {}, params: {})
        get("/loyalty/stores/#{corporation_id}/offers/", headers: headers, params: params)
      end
    end
  end
end
