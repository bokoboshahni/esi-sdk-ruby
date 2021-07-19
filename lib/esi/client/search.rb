# frozen_string_literal: true

module ESI
  class Client
    # ESI search operations.
    module Search
      # Search for entities that match a given sub-string.
      #
      # This endpoint is cached for up to 3600 seconds.
      #
      # This endpoint requires authorization (see {ESI::Client#authorize}).
      #
      # @esi_scope esi-search.search_structures.v1
      #
      # @esi_version dev
      # @esi_version legacy
      # @esi_version v3
      #
      # @param character_id [Integer,String] An EVE character ID
      # @param categories [Array] Type of entities to search for
      # @param search [String] The string to search on
      # @param strict [Boolean] Whether the search should be a strict match
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
      # @see https://esi.evetech.net/ui/#/Search/get_characters_character_id_search
      def get_character_search(character_id:, categories:, search:, strict:, params: {}, headers: {})
        query_string = URI.encode_www_form([["categories", categories], ["search", search], ["strict", strict]])
        get("/characters/#{character_id}/search/?#{query_string}", headers: headers, params: params)
      end
      alias get_characters_character_id_search get_character_search

      # Search for entities that match a given sub-string.
      #
      # This endpoint is cached for up to 3600 seconds.
      #
      # @esi_version dev
      # @esi_version legacy
      # @esi_version v2
      #
      # @param categories [Array] Type of entities to search for
      # @param search [String] The string to search on
      # @param strict [Boolean] Whether the search should be a strict match
      # @param params [Hash] Additional query string parameters
      # @param headers [Hash] Additional headers
      #
      # @raise [ESI::Errors::BadRequestError] Bad request
      # @raise [ESI::Errors::ErrorLimitedError] Error limited
      # @raise [ESI::Errors::InternalServerError] Internal server error
      # @raise [ESI::Errors::ServiceUnavailableError] Service unavailable
      # @raise [ESI::Errors::GatewayTimeoutError] Gateway timeout
      #
      # @see https://esi.evetech.net/ui/#/Search/get_search
      def get_search(categories:, search:, strict:, params: {}, headers: {})
        query_string = URI.encode_www_form([["categories", categories], ["search", search], ["strict", strict]])
        get("/search/?#{query_string}", headers: headers, params: params)
      end
    end
  end
end
