# frozen_string_literal: true

module ESI
  class Client
    # ESI mail operations.
    module Mail
      # Delete a mail.
      #
      # This endpoint requires authorization (see {ESI::Client#authorize}).
      #
      # @esi_scope esi-mail.organize_mail.v1
      #
      # @esi_version dev
      # @esi_version legacy
      # @esi_version v1
      #
      # @param character_id [Integer,String] An EVE character ID
      # @param mail_id [Integer,String] An EVE mail ID
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
      # @see https://esi.evetech.net/ui/#/Mail/delete_characters_character_id_mail_mail_id
      def delete_character_mail(character_id:, mail_id:, params: {}, headers: {})
        delete("/characters/#{character_id}/mail/#{mail_id}/", headers: headers, params: params)
      end
      alias delete_characters_character_id_mail_mail_id delete_character_mail

      # Delete a mail label.
      #
      # This endpoint requires authorization (see {ESI::Client#authorize}).
      #
      # @esi_scope esi-mail.organize_mail.v1
      #
      # @esi_version dev
      # @esi_version legacy
      # @esi_version v1
      #
      # @param character_id [Integer,String] An EVE character ID
      # @param label_id [Integer,String] An EVE label id
      # @param params [Hash] Additional query string parameters
      # @param headers [Hash] Additional headers
      #
      # @raise [ESI::Errors::BadRequestError] Bad request
      # @raise [ESI::Errors::UnauthorizedError] Unauthorized
      # @raise [ESI::Errors::ForbiddenError] Forbidden
      # @raise [ESI::Errors::ErrorLimitedError] Error limited
      # @raise [ESI::Errors::UnprocessableEntityError] Default labels cannot be deleted
      # @raise [ESI::Errors::InternalServerError] Internal server error
      # @raise [ESI::Errors::ServiceUnavailableError] Service unavailable
      # @raise [ESI::Errors::GatewayTimeoutError] Gateway timeout
      #
      # @see https://esi.evetech.net/ui/#/Mail/delete_characters_character_id_mail_labels_label_id
      def delete_character_mail_label(character_id:, label_id:, params: {}, headers: {})
        delete("/characters/#{character_id}/mail/labels/#{label_id}/", headers: headers, params: params)
      end
      alias delete_characters_character_id_mail_labels_label_id delete_character_mail_label

      # Return the contents of an EVE mail.
      #
      # This endpoint is cached for up to 30 seconds.
      #
      # This endpoint requires authorization (see {ESI::Client#authorize}).
      #
      # @esi_scope esi-mail.read_mail.v1
      #
      # @esi_version dev
      # @esi_version legacy
      # @esi_version v1
      #
      # @param character_id [Integer,String] An EVE character ID
      # @param mail_id [Integer,String] An EVE mail ID
      # @param params [Hash] Additional query string parameters
      # @param headers [Hash] Additional headers
      #
      # @raise [ESI::Errors::BadRequestError] Bad request
      # @raise [ESI::Errors::UnauthorizedError] Unauthorized
      # @raise [ESI::Errors::ForbiddenError] Forbidden
      # @raise [ESI::Errors::NotFoundError] Mail not found
      # @raise [ESI::Errors::ErrorLimitedError] Error limited
      # @raise [ESI::Errors::InternalServerError] Internal server error
      # @raise [ESI::Errors::ServiceUnavailableError] Service unavailable
      # @raise [ESI::Errors::GatewayTimeoutError] Gateway timeout
      #
      # @see https://esi.evetech.net/ui/#/Mail/get_characters_character_id_mail_mail_id
      def get_character_mail(character_id:, mail_id:, params: {}, headers: {})
        get("/characters/#{character_id}/mail/#{mail_id}/", headers: headers, params: params)
      end
      alias get_characters_character_id_mail_mail_id get_character_mail

      # Return a list of the users mail labels, unread counts for each label and a total unread count.
      #
      # This endpoint is cached for up to 30 seconds.
      #
      # This endpoint requires authorization (see {ESI::Client#authorize}).
      #
      # @esi_scope esi-mail.read_mail.v1
      #
      # @esi_version dev
      # @esi_version v3
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
      # @see https://esi.evetech.net/ui/#/Mail/get_characters_character_id_mail_labels
      def get_character_mail_labels(character_id:, params: {}, headers: {})
        get("/characters/#{character_id}/mail/labels/", headers: headers, params: params)
      end
      alias get_characters_character_id_mail_labels get_character_mail_labels

      # Return all mailing lists that the character is subscribed to.
      #
      # This endpoint is cached for up to 120 seconds.
      #
      # This endpoint requires authorization (see {ESI::Client#authorize}).
      #
      # @esi_scope esi-mail.read_mail.v1
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
      # @see https://esi.evetech.net/ui/#/Mail/get_characters_character_id_mail_lists
      def get_character_mail_lists(character_id:, params: {}, headers: {})
        get("/characters/#{character_id}/mail/lists/", headers: headers, params: params)
      end
      alias get_characters_character_id_mail_lists get_character_mail_lists

      # Create and send a new mail.
      #
      # This endpoint requires authorization (see {ESI::Client#authorize}).
      #
      # @esi_scope esi-mail.send_mail.v1
      #
      # @esi_version dev
      # @esi_version legacy
      # @esi_version v1
      #
      # @param character_id [Integer,String] An EVE character ID
      # @param mail [Hash] The mail to send
      # @param headers [Hash] Additional headers
      #
      # @raise [ESI::Errors::BadRequestError] Bad request
      # @raise [ESI::Errors::UnauthorizedError] Unauthorized
      # @raise [ESI::Errors::ForbiddenError] Forbidden
      # @raise [ESI::Errors::ErrorLimitedError] Error limited
      # @raise [ESI::Errors::InternalServerError] Internal server error
      # @raise [ESI::Errors::ServiceUnavailableError] Service unavailable
      # @raise [ESI::Errors::GatewayTimeoutError] Gateway timeout
      # @raise [ESI::Errors::EveServerError] Internal error thrown from the EVE server. Most of the time this means you have hit an EVE server rate limit
      #
      # @see https://esi.evetech.net/ui/#/Mail/post_characters_character_id_mail
      def post_character_mail(character_id:, mail:, headers: {})
        post("/characters/#{character_id}/mail/", headers: headers, payload: mail)
      end
      alias post_characters_character_id_mail post_character_mail

      # Create a mail label.
      #
      # This endpoint requires authorization (see {ESI::Client#authorize}).
      #
      # @esi_scope esi-mail.organize_mail.v1
      #
      # @esi_version dev
      # @esi_version legacy
      # @esi_version v2
      #
      # @param character_id [Integer,String] An EVE character ID
      # @param label [Hash] Label to create
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
      # @see https://esi.evetech.net/ui/#/Mail/post_characters_character_id_mail_labels
      def post_character_mail_labels(character_id:, label:, headers: {})
        post("/characters/#{character_id}/mail/labels/", headers: headers, payload: label)
      end
      alias post_characters_character_id_mail_labels post_character_mail_labels

      # Update metadata about a mail.
      #
      # This endpoint requires authorization (see {ESI::Client#authorize}).
      #
      # @esi_scope esi-mail.organize_mail.v1
      #
      # @esi_version dev
      # @esi_version legacy
      # @esi_version v1
      #
      # @param character_id [Integer,String] An EVE character ID
      # @param mail_id [Integer,String] An EVE mail ID
      # @param contents [Hash] Data used to update the mail
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
      # @see https://esi.evetech.net/ui/#/Mail/put_characters_character_id_mail_mail_id
      def put_character_mail(character_id:, mail_id:, contents:, headers: {})
        put("/characters/#{character_id}/mail/#{mail_id}/", headers: headers, payload: contents)
      end
      alias put_characters_character_id_mail_mail_id put_character_mail
    end
  end
end