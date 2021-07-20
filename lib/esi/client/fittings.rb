# frozen_string_literal: true

module ESI
  class Client
    # ESI fittings operations.
    module Fitting
      # Delete a fitting from a character.
      #
      # This endpoint requires authorization (see {ESI::Client#authorize}).
      #
      # @esi_scope esi-fittings.write_fittings.v1
      #
      # @esi_version dev
      # @esi_version legacy
      # @esi_version v1
      #
      # @param character_id [Integer] An EVE character ID
      # @param fitting_id [Integer] ID for a fitting of this character
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
      # @see https://esi.evetech.net/ui/#/Fittings/delete_characters_character_id_fittings_fitting_id
      def delete_character_fitting(character_id:, fitting_id:, headers: {}, params: {})
        delete("/characters/#{character_id}/fittings/#{fitting_id}/", headers: headers, params: params)
      end
      alias delete_characters_character_id_fittings_fitting_id delete_character_fitting

      # Return fittings of a character.
      #
      # This endpoint is cached for up to 300 seconds.
      #
      # This endpoint requires authorization (see {ESI::Client#authorize}).
      #
      # @esi_scope esi-fittings.read_fittings.v1
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
      # @see https://esi.evetech.net/ui/#/Fittings/get_characters_character_id_fittings
      def get_character_fittings(character_id:, headers: {}, params: {})
        get("/characters/#{character_id}/fittings/", headers: headers, params: params)
      end
      alias get_characters_character_id_fittings get_character_fittings

      # Save a new fitting for a character.
      #
      # This endpoint requires authorization (see {ESI::Client#authorize}).
      #
      # @esi_scope esi-fittings.write_fittings.v1
      #
      # @esi_version dev
      # @esi_version v2
      #
      # @param character_id [Integer] An EVE character ID
      # @param fitting [Hash] Details about the new fitting
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
      # @see https://esi.evetech.net/ui/#/Fittings/post_characters_character_id_fittings
      def post_character_fittings(character_id:, fitting:, headers: {}, params: {})
        post("/characters/#{character_id}/fittings/", headers: headers, params: params, payload: fitting)
      end
      alias post_characters_character_id_fittings post_character_fittings
    end
  end
end
