# frozen_string_literal: true

module ESI
  class Client
    # ESI user interface operations.
    module UserInterface
      # Set a solar system as autopilot waypoint.
      #
      # This endpoint requires authorization (see {ESI::Client#authorize}).
      #
      # @esi_scope esi-ui.write_waypoint.v1
      #
      # @esi_version dev
      # @esi_version legacy
      # @esi_version v2
      #
      # @param add_to_beginning [Boolean] Whether this solar system should be added to the beginning of all waypoints
      # @param clear_other_waypoints [Boolean] Whether clean other waypoints beforing adding this one
      # @param destination_id [Integer] The destination to travel to, can be solar system, station or structure's id
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
      # @see https://esi.evetech.net/ui/#/User Interface/post_ui_autopilot_waypoint
      def post_ui_autopilot_waypoint(add_to_beginning:, clear_other_waypoints:, destination_id:, headers: {}, params: {})
        parse_response(post_ui_autopilot_waypoint_raw(add_to_beginning: add_to_beginning, clear_other_waypoints: clear_other_waypoints, destination_id: destination_id, headers: headers, params: params))
      end

      # Set a solar system as autopilot waypoint.
      #
      # This endpoint requires authorization (see {ESI::Client#authorize}).
      #
      # @esi_scope esi-ui.write_waypoint.v1
      #
      # @esi_version dev
      # @esi_version legacy
      # @esi_version v2
      #
      # @param add_to_beginning [Boolean] Whether this solar system should be added to the beginning of all waypoints
      # @param clear_other_waypoints [Boolean] Whether clean other waypoints beforing adding this one
      # @param destination_id [Integer] The destination to travel to, can be solar system, station or structure's id
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
      # @see https://esi.evetech.net/ui/#/User Interface/post_ui_autopilot_waypoint
      def post_ui_autopilot_waypoint_raw(add_to_beginning:, clear_other_waypoints:, destination_id:, headers: {}, params: {})
        params.merge!('add_to_beginning' => add_to_beginning, 'clear_other_waypoints' => clear_other_waypoints, 'destination_id' => destination_id)
        post('/ui/autopilot/waypoint/', headers: headers, params: params)
      end

      # Open the contract window inside the client.
      #
      # This endpoint requires authorization (see {ESI::Client#authorize}).
      #
      # @esi_scope esi-ui.open_window.v1
      #
      # @esi_version dev
      # @esi_version legacy
      # @esi_version v1
      #
      # @param contract_id [Integer] The contract to open
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
      # @see https://esi.evetech.net/ui/#/User Interface/post_ui_openwindow_contract
      def post_ui_openwindow_contract(contract_id:, headers: {}, params: {})
        parse_response(post_ui_openwindow_contract_raw(contract_id: contract_id, headers: headers, params: params))
      end

      # Open the contract window inside the client.
      #
      # This endpoint requires authorization (see {ESI::Client#authorize}).
      #
      # @esi_scope esi-ui.open_window.v1
      #
      # @esi_version dev
      # @esi_version legacy
      # @esi_version v1
      #
      # @param contract_id [Integer] The contract to open
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
      # @see https://esi.evetech.net/ui/#/User Interface/post_ui_openwindow_contract
      def post_ui_openwindow_contract_raw(contract_id:, headers: {}, params: {})
        params.merge!('contract_id' => contract_id)
        post('/ui/openwindow/contract/', headers: headers, params: params)
      end

      # Open the information window for a character, corporation or alliance inside the client.
      #
      # This endpoint requires authorization (see {ESI::Client#authorize}).
      #
      # @esi_scope esi-ui.open_window.v1
      #
      # @esi_version dev
      # @esi_version legacy
      # @esi_version v1
      #
      # @param target_id [Integer] The target to open
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
      # @see https://esi.evetech.net/ui/#/User Interface/post_ui_openwindow_information
      def post_ui_openwindow_information(target_id:, headers: {}, params: {})
        parse_response(post_ui_openwindow_information_raw(target_id: target_id, headers: headers, params: params))
      end

      # Open the information window for a character, corporation or alliance inside the client.
      #
      # This endpoint requires authorization (see {ESI::Client#authorize}).
      #
      # @esi_scope esi-ui.open_window.v1
      #
      # @esi_version dev
      # @esi_version legacy
      # @esi_version v1
      #
      # @param target_id [Integer] The target to open
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
      # @see https://esi.evetech.net/ui/#/User Interface/post_ui_openwindow_information
      def post_ui_openwindow_information_raw(target_id:, headers: {}, params: {})
        params.merge!('target_id' => target_id)
        post('/ui/openwindow/information/', headers: headers, params: params)
      end

      # Open the market details window for a specific typeID inside the client.
      #
      # This endpoint requires authorization (see {ESI::Client#authorize}).
      #
      # @esi_scope esi-ui.open_window.v1
      #
      # @esi_version dev
      # @esi_version legacy
      # @esi_version v1
      #
      # @param type_id [Integer] The item type to open in market window
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
      # @see https://esi.evetech.net/ui/#/User Interface/post_ui_openwindow_marketdetails
      def post_ui_openwindow_marketdetails(type_id:, headers: {}, params: {})
        parse_response(post_ui_openwindow_marketdetails_raw(type_id: type_id, headers: headers, params: params))
      end

      # Open the market details window for a specific typeID inside the client.
      #
      # This endpoint requires authorization (see {ESI::Client#authorize}).
      #
      # @esi_scope esi-ui.open_window.v1
      #
      # @esi_version dev
      # @esi_version legacy
      # @esi_version v1
      #
      # @param type_id [Integer] The item type to open in market window
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
      # @see https://esi.evetech.net/ui/#/User Interface/post_ui_openwindow_marketdetails
      def post_ui_openwindow_marketdetails_raw(type_id:, headers: {}, params: {})
        params.merge!('type_id' => type_id)
        post('/ui/openwindow/marketdetails/', headers: headers, params: params)
      end

      # Open the New Mail window, according to settings from the request if applicable.
      #
      # This endpoint requires authorization (see {ESI::Client#authorize}).
      #
      # @esi_scope esi-ui.open_window.v1
      #
      # @esi_version dev
      # @esi_version legacy
      # @esi_version v1
      #
      # @param new_mail [Hash] The details of mail to create
      # @param params [Hash] Additional query string parameters
      # @param headers [Hash] Additional headers
      #
      # @raise [ESI::Errors::BadRequestError] Bad request
      # @raise [ESI::Errors::UnauthorizedError] Unauthorized
      # @raise [ESI::Errors::ForbiddenError] Forbidden
      # @raise [ESI::Errors::ErrorLimitedError] Error limited
      # @raise [ESI::Errors::UnprocessableEntityError] Invalid request
      # @raise [ESI::Errors::InternalServerError] Internal server error
      # @raise [ESI::Errors::ServiceUnavailableError] Service unavailable
      # @raise [ESI::Errors::GatewayTimeoutError] Gateway timeout
      #
      # @see https://esi.evetech.net/ui/#/User Interface/post_ui_openwindow_newmail
      def post_ui_openwindow_newmail(new_mail:, headers: {}, params: {})
        parse_response(post_ui_openwindow_newmail_raw(new_mail: new_mail, headers: headers, params: params))
      end

      # Open the New Mail window, according to settings from the request if applicable.
      #
      # This endpoint requires authorization (see {ESI::Client#authorize}).
      #
      # @esi_scope esi-ui.open_window.v1
      #
      # @esi_version dev
      # @esi_version legacy
      # @esi_version v1
      #
      # @param new_mail [Hash] The details of mail to create
      # @param params [Hash] Additional query string parameters
      # @param headers [Hash] Additional headers
      #
      # @raise [ESI::Errors::BadRequestError] Bad request
      # @raise [ESI::Errors::UnauthorizedError] Unauthorized
      # @raise [ESI::Errors::ForbiddenError] Forbidden
      # @raise [ESI::Errors::ErrorLimitedError] Error limited
      # @raise [ESI::Errors::UnprocessableEntityError] Invalid request
      # @raise [ESI::Errors::InternalServerError] Internal server error
      # @raise [ESI::Errors::ServiceUnavailableError] Service unavailable
      # @raise [ESI::Errors::GatewayTimeoutError] Gateway timeout
      #
      # @see https://esi.evetech.net/ui/#/User Interface/post_ui_openwindow_newmail
      def post_ui_openwindow_newmail_raw(new_mail:, headers: {}, params: {})
        post('/ui/openwindow/newmail/', headers: headers, params: params, payload: new_mail)
      end
    end
  end
end
