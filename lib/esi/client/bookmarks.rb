# frozen_string_literal: true

module ESI
  class Client
    # ESI bookmarks operations.
    module Bookmark
      # A list of your character's personal bookmark folders.
      #
      # This endpoint is cached for up to 3600 seconds.
      #
      # This endpoint requires authorization (see {ESI::Client#authorize}).
      #
      # @esi_scope esi-bookmarks.read_character_bookmarks.v1
      #
      # @esi_version dev
      # @esi_version v2
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
      # @see https://esi.evetech.net/ui/#/Bookmarks/get_characters_character_id_bookmarks_folders
      def get_character_bookmark_folders(character_id:, params: {}, headers: {})
        get("/characters/#{character_id}/bookmarks/folders/", headers: headers, params: params)
      end
      alias get_characters_character_id_bookmarks_folders get_character_bookmark_folders

      # A list of your character's personal bookmarks.
      #
      # This endpoint is cached for up to 3600 seconds.
      #
      # This endpoint requires authorization (see {ESI::Client#authorize}).
      #
      # @esi_scope esi-bookmarks.read_character_bookmarks.v1
      #
      # @esi_version dev
      # @esi_version v2
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
      # @see https://esi.evetech.net/ui/#/Bookmarks/get_characters_character_id_bookmarks
      def get_character_bookmarks(character_id:, params: {}, headers: {})
        get("/characters/#{character_id}/bookmarks/", headers: headers, params: params)
      end
      alias get_characters_character_id_bookmarks get_character_bookmarks

      # A list of your corporation's bookmark folders.
      #
      # This endpoint is cached for up to 3600 seconds.
      #
      # This endpoint requires authorization (see {ESI::Client#authorize}).
      #
      # @esi_scope esi-bookmarks.read_corporation_bookmarks.v1
      #
      # @esi_version dev
      # @esi_version legacy
      # @esi_version v1
      #
      # @param corporation_id [Integer,String] An EVE corporation ID
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
      # @see https://esi.evetech.net/ui/#/Bookmarks/get_corporations_corporation_id_bookmarks_folders
      def get_corporation_bookmark_folders(corporation_id:, params: {}, headers: {})
        get("/corporations/#{corporation_id}/bookmarks/folders/", headers: headers, params: params)
      end
      alias get_corporations_corporation_id_bookmarks_folders get_corporation_bookmark_folders

      # A list of your corporation's bookmarks.
      #
      # This endpoint is cached for up to 3600 seconds.
      #
      # This endpoint requires authorization (see {ESI::Client#authorize}).
      #
      # @esi_scope esi-bookmarks.read_corporation_bookmarks.v1
      #
      # @esi_version dev
      # @esi_version legacy
      # @esi_version v1
      #
      # @param corporation_id [Integer,String] An EVE corporation ID
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
      # @see https://esi.evetech.net/ui/#/Bookmarks/get_corporations_corporation_id_bookmarks
      def get_corporation_bookmarks(corporation_id:, params: {}, headers: {})
        get("/corporations/#{corporation_id}/bookmarks/", headers: headers, params: params)
      end
      alias get_corporations_corporation_id_bookmarks get_corporation_bookmarks
    end
  end
end
