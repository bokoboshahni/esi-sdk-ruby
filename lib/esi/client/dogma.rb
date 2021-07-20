# frozen_string_literal: true

module ESI
  class Client
    # ESI dogma operations.
    module Dogma
      # Get information on a dogma attribute.
      #
      # @esi_version dev
      # @esi_version legacy
      # @esi_version v1
      #
      # @param attribute_id [Integer] A dogma attribute ID
      # @param params [Hash] Additional query string parameters
      # @param headers [Hash] Additional headers
      #
      # @raise [ESI::Errors::BadRequestError] Bad request
      # @raise [ESI::Errors::NotFoundError] Dogma attribute not found
      # @raise [ESI::Errors::ErrorLimitedError] Error limited
      # @raise [ESI::Errors::InternalServerError] Internal server error
      # @raise [ESI::Errors::ServiceUnavailableError] Service unavailable
      # @raise [ESI::Errors::GatewayTimeoutError] Gateway timeout
      #
      # @see https://esi.evetech.net/ui/#/Dogma/get_dogma_attributes_attribute_id
      def get_dogma_attribute(attribute_id:, headers: {}, params: {})
        get("/dogma/attributes/#{attribute_id}/", headers: headers, params: params)
      end
      alias get_dogma_attributes_attribute_id get_dogma_attribute

      # Get a list of dogma attribute ids.
      #
      # @esi_version dev
      # @esi_version legacy
      # @esi_version v1
      #
      # @param params [Hash] Additional query string parameters
      # @param headers [Hash] Additional headers
      #
      # @raise [ESI::Errors::BadRequestError] Bad request
      # @raise [ESI::Errors::ErrorLimitedError] Error limited
      # @raise [ESI::Errors::InternalServerError] Internal server error
      # @raise [ESI::Errors::ServiceUnavailableError] Service unavailable
      # @raise [ESI::Errors::GatewayTimeoutError] Gateway timeout
      #
      # @see https://esi.evetech.net/ui/#/Dogma/get_dogma_attributes
      def get_dogma_attributes(headers: {}, params: {})
        get("/dogma/attributes/", headers: headers, params: params)
      end

      # Returns info about a dynamic item resulting from mutation with a mutaplasmid.
      #
      # @esi_version dev
      # @esi_version legacy
      # @esi_version v1
      #
      # @param item_id [Integer] item_id integer
      # @param type_id [Integer] type_id integer
      # @param params [Hash] Additional query string parameters
      # @param headers [Hash] Additional headers
      #
      # @raise [ESI::Errors::BadRequestError] Bad request
      # @raise [ESI::Errors::NotFoundError] Item not found
      # @raise [ESI::Errors::ErrorLimitedError] Error limited
      # @raise [ESI::Errors::InternalServerError] Internal server error
      # @raise [ESI::Errors::ServiceUnavailableError] Service unavailable
      # @raise [ESI::Errors::GatewayTimeoutError] Gateway timeout
      #
      # @see https://esi.evetech.net/ui/#/Dogma/get_dogma_dynamic_items_type_id_item_id
      def get_dogma_dynamic_items_type_item(item_id:, type_id:, headers: {}, params: {})
        get("/dogma/dynamic/items/#{type_id}/#{item_id}/", headers: headers, params: params)
      end
      alias get_dogma_dynamic_items_type_id_item_id get_dogma_dynamic_items_type_item

      # Get information on a dogma effect.
      #
      # @esi_version dev
      # @esi_version v2
      #
      # @param effect_id [Integer] A dogma effect ID
      # @param params [Hash] Additional query string parameters
      # @param headers [Hash] Additional headers
      #
      # @raise [ESI::Errors::BadRequestError] Bad request
      # @raise [ESI::Errors::NotFoundError] Dogma effect not found
      # @raise [ESI::Errors::ErrorLimitedError] Error limited
      # @raise [ESI::Errors::InternalServerError] Internal server error
      # @raise [ESI::Errors::ServiceUnavailableError] Service unavailable
      # @raise [ESI::Errors::GatewayTimeoutError] Gateway timeout
      #
      # @see https://esi.evetech.net/ui/#/Dogma/get_dogma_effects_effect_id
      def get_dogma_effect(effect_id:, headers: {}, params: {})
        get("/dogma/effects/#{effect_id}/", headers: headers, params: params)
      end
      alias get_dogma_effects_effect_id get_dogma_effect

      # Get a list of dogma effect ids.
      #
      # @esi_version dev
      # @esi_version legacy
      # @esi_version v1
      #
      # @param params [Hash] Additional query string parameters
      # @param headers [Hash] Additional headers
      #
      # @raise [ESI::Errors::BadRequestError] Bad request
      # @raise [ESI::Errors::ErrorLimitedError] Error limited
      # @raise [ESI::Errors::InternalServerError] Internal server error
      # @raise [ESI::Errors::ServiceUnavailableError] Service unavailable
      # @raise [ESI::Errors::GatewayTimeoutError] Gateway timeout
      #
      # @see https://esi.evetech.net/ui/#/Dogma/get_dogma_effects
      def get_dogma_effects(headers: {}, params: {})
        get("/dogma/effects/", headers: headers, params: params)
      end
    end
  end
end
