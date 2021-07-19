# frozen_string_literal: true

module ESI
  class Client
    # ESI calendar operations.
    module Calendar
      # Get 50 event summaries from the calendar. If no from_event ID is given, the resource will return the next 50 chronological event summaries from now. If a from_event ID is specified, it will return the next 50 chronological event summaries from after that event.
      #
      # This endpoint is cached for up to 5 seconds.
      #
      # This endpoint requires authorization (see {ESI::Client#authorize}).
      #
      # @esi_scope esi-calendar.read_calendar_events.v1
      #
      # @esi_version dev
      # @esi_version legacy
      # @esi_version v1
      # @esi_version v2
      #
      # @param character_id [Integer,String] An EVE character ID
      # @param from_event [Integer] The event ID to retrieve events from
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
      # @see https://esi.evetech.net/ui/#/Calendar/get_characters_character_id_calendar
      def get_character_calendar(character_id:, from_event:, params: {}, headers: {})
        query_string = URI.encode_www_form([["from_event", from_event]])
        get("/characters/#{character_id}/calendar/?#{query_string}", headers: headers, params: params)
      end
      alias get_characters_character_id_calendar get_character_calendar

      # Get all the information for a specific event.
      #
      # This endpoint is cached for up to 5 seconds.
      #
      # This endpoint requires authorization (see {ESI::Client#authorize}).
      #
      # @esi_scope esi-calendar.read_calendar_events.v1
      #
      # @esi_version dev
      # @esi_version legacy
      # @esi_version v3
      # @esi_version v4
      #
      # @param character_id [Integer,String] An EVE character ID
      # @param event_id [Integer,String] The id of the event requested
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
      # @see https://esi.evetech.net/ui/#/Calendar/get_characters_character_id_calendar_event_id
      def get_character_calendar_event(character_id:, event_id:, params: {}, headers: {})
        get("/characters/#{character_id}/calendar/#{event_id}/", headers: headers, params: params)
      end
      alias get_characters_character_id_calendar_event_id get_character_calendar_event

      # Get all invited attendees for a given event.
      #
      # This endpoint is cached for up to 600 seconds.
      #
      # This endpoint requires authorization (see {ESI::Client#authorize}).
      #
      # @esi_scope esi-calendar.read_calendar_events.v1
      #
      # @esi_version dev
      # @esi_version legacy
      # @esi_version v1
      # @esi_version v2
      #
      # @param character_id [Integer,String] An EVE character ID
      # @param event_id [Integer,String] The id of the event requested
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
      # @see https://esi.evetech.net/ui/#/Calendar/get_characters_character_id_calendar_event_id_attendees
      def get_character_calendar_event_attendees(character_id:, event_id:, params: {}, headers: {})
        get("/characters/#{character_id}/calendar/#{event_id}/attendees/", headers: headers, params: params)
      end
      alias get_characters_character_id_calendar_event_id_attendees get_character_calendar_event_attendees

      # Set your response status to an event.
      #
      # This endpoint is cached for up to 5 seconds.
      #
      # This endpoint requires authorization (see {ESI::Client#authorize}).
      #
      # @esi_scope esi-calendar.respond_calendar_events.v1
      #
      # @esi_version dev
      # @esi_version legacy
      # @esi_version v3
      # @esi_version v4
      #
      # @param character_id [Integer,String] An EVE character ID
      # @param event_id [Integer,String] The ID of the event requested
      # @param response [Hash] The response value to set, overriding current value
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
      # @see https://esi.evetech.net/ui/#/Calendar/put_characters_character_id_calendar_event_id
      def put_character_calendar_event(character_id:, event_id:, response:, headers: {})
        put("/characters/#{character_id}/calendar/#{event_id}/", headers: headers, payload: response)
      end
      alias put_characters_character_id_calendar_event_id put_character_calendar_event
    end
  end
end
