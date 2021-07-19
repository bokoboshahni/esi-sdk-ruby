# frozen_string_literal: true

module ESI
  class Client
    # ESI contacts operations.
    module Contact
      # Bulk delete contacts.
      #
      # This endpoint requires authorization (see {ESI::Client#authorize}).
      #
      # @esi_scope esi-characters.write_contacts.v1
      #
      # @esi_version dev
      # @esi_version v2
      #
      # @param character_id [Integer,String] An EVE character ID
      # @param contact_ids [Array] A list of contacts to delete
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
      # @see https://esi.evetech.net/ui/#/Contacts/delete_characters_character_id_contacts
      def delete_character_contacts(character_id:, contact_ids:, params: {}, headers: {})
        query_string = URI.encode_www_form([["contact_ids", contact_ids]])
        delete("/characters/#{character_id}/contacts/?#{query_string}", headers: headers, params: params)
      end
      alias delete_characters_character_id_contacts delete_character_contacts

      # Return custom labels for an alliance's contacts.
      #
      # This endpoint is cached for up to 300 seconds.
      #
      # This endpoint requires authorization (see {ESI::Client#authorize}).
      #
      # @esi_scope esi-alliances.read_contacts.v1
      #
      # @esi_version dev
      # @esi_version legacy
      # @esi_version v1
      #
      # @param alliance_id [Integer,String] An EVE alliance ID
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
      # @see https://esi.evetech.net/ui/#/Contacts/get_alliances_alliance_id_contacts_labels
      def get_alliance_contact_labels(alliance_id:, params: {}, headers: {})
        get("/alliances/#{alliance_id}/contacts/labels/", headers: headers, params: params)
      end
      alias get_alliances_alliance_id_contacts_labels get_alliance_contact_labels

      # Return contacts of an alliance.
      #
      # This endpoint is cached for up to 300 seconds.
      #
      # This endpoint requires authorization (see {ESI::Client#authorize}).
      #
      # @esi_scope esi-alliances.read_contacts.v1
      #
      # @esi_version dev
      # @esi_version v2
      #
      # @param alliance_id [Integer,String] An EVE alliance ID
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
      # @see https://esi.evetech.net/ui/#/Contacts/get_alliances_alliance_id_contacts
      def get_alliance_contacts(alliance_id:, params: {}, headers: {})
        get("/alliances/#{alliance_id}/contacts/", headers: headers, params: params)
      end
      alias get_alliances_alliance_id_contacts get_alliance_contacts

      # Return custom labels for a character's contacts.
      #
      # This endpoint is cached for up to 300 seconds.
      #
      # This endpoint requires authorization (see {ESI::Client#authorize}).
      #
      # @esi_scope esi-characters.read_contacts.v1
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
      # @see https://esi.evetech.net/ui/#/Contacts/get_characters_character_id_contacts_labels
      def get_character_contact_labels(character_id:, params: {}, headers: {})
        get("/characters/#{character_id}/contacts/labels/", headers: headers, params: params)
      end
      alias get_characters_character_id_contacts_labels get_character_contact_labels

      # Return contacts of a character.
      #
      # This endpoint is cached for up to 300 seconds.
      #
      # This endpoint requires authorization (see {ESI::Client#authorize}).
      #
      # @esi_scope esi-characters.read_contacts.v1
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
      # @see https://esi.evetech.net/ui/#/Contacts/get_characters_character_id_contacts
      def get_character_contacts(character_id:, params: {}, headers: {})
        get("/characters/#{character_id}/contacts/", headers: headers, params: params)
      end
      alias get_characters_character_id_contacts get_character_contacts

      # Return custom labels for a corporation's contacts.
      #
      # This endpoint is cached for up to 300 seconds.
      #
      # This endpoint requires authorization (see {ESI::Client#authorize}).
      #
      # @esi_scope esi-corporations.read_contacts.v1
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
      # @see https://esi.evetech.net/ui/#/Contacts/get_corporations_corporation_id_contacts_labels
      def get_corporation_contact_labels(corporation_id:, params: {}, headers: {})
        get("/corporations/#{corporation_id}/contacts/labels/", headers: headers, params: params)
      end
      alias get_corporations_corporation_id_contacts_labels get_corporation_contact_labels

      # Return contacts of a corporation.
      #
      # This endpoint is cached for up to 300 seconds.
      #
      # This endpoint requires authorization (see {ESI::Client#authorize}).
      #
      # @esi_scope esi-corporations.read_contacts.v1
      #
      # @esi_version dev
      # @esi_version v2
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
      # @see https://esi.evetech.net/ui/#/Contacts/get_corporations_corporation_id_contacts
      def get_corporation_contacts(corporation_id:, params: {}, headers: {})
        get("/corporations/#{corporation_id}/contacts/", headers: headers, params: params)
      end
      alias get_corporations_corporation_id_contacts get_corporation_contacts

      # Bulk add contacts with same settings.
      #
      # This endpoint requires authorization (see {ESI::Client#authorize}).
      #
      # @esi_scope esi-characters.write_contacts.v1
      #
      # @esi_version dev
      # @esi_version v2
      #
      # @param character_id [Integer,String] An EVE character ID
      # @param contact_ids [Array] A list of contacts
      # @param label_ids [Array] Add custom labels to the new contact
      # @param standing [Number] Standing for the contact
      # @param watched [Boolean] Whether the contact should be watched, note this is only effective on characters
      # @param headers [Hash] Additional headers
      #
      # @raise [ESI::Errors::BadRequestError] Bad request
      # @raise [ESI::Errors::UnauthorizedError] Unauthorized
      # @raise [ESI::Errors::ForbiddenError] Forbidden
      # @raise [ESI::Errors::ErrorLimitedError] Error limited
      # @raise [ESI::Errors::InternalServerError] Internal server error
      # @raise [ESI::Errors::ServiceUnavailableError] Service unavailable
      # @raise [ESI::Errors::GatewayTimeoutError] Gateway timeout
      # @raise [ESI::Errors::EveServerError] Internal error thrown from the EVE server
      #
      # @see https://esi.evetech.net/ui/#/Contacts/post_characters_character_id_contacts
      def post_character_contacts(character_id:, contact_ids:, label_ids:, standing:, watched:, headers: {})
        query_string = URI.encode_www_form([["label_ids", label_ids], ["standing", standing], ["watched", watched]])
        post("/characters/#{character_id}/contacts/?#{query_string}", headers: headers, payload: contact_ids)
      end
      alias post_characters_character_id_contacts post_character_contacts

      # Bulk edit contacts with same settings.
      #
      # This endpoint requires authorization (see {ESI::Client#authorize}).
      #
      # @esi_scope esi-characters.write_contacts.v1
      #
      # @esi_version dev
      # @esi_version v2
      #
      # @param character_id [Integer,String] An EVE character ID
      # @param contact_ids [Array] A list of contacts
      # @param label_ids [Array] Add custom labels to the contact
      # @param standing [Number] Standing for the contact
      # @param watched [Boolean] Whether the contact should be watched, note this is only effective on characters
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
      # @see https://esi.evetech.net/ui/#/Contacts/put_characters_character_id_contacts
      def put_character_contacts(character_id:, contact_ids:, label_ids:, standing:, watched:, headers: {})
        query_string = URI.encode_www_form([["label_ids", label_ids], ["standing", standing], ["watched", watched]])
        put("/characters/#{character_id}/contacts/?#{query_string}", headers: headers, payload: contact_ids)
      end
      alias put_characters_character_id_contacts put_character_contacts
    end
  end
end
