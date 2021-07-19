# frozen_string_literal: true

module ESI
  # Namespace for ESI errors.
  module Errors
    # Base class for ESI errors.
    class Error < RuntimeError
    end

    # Base class for ESI client errors.
    class ClientError < Error
      attr_reader :response

      def initialize(msg, response:)
        super(msg)

        @response = response
      end
    end

    # ESI unauthorized error.
    class UnauthorizedError < ClientError; end

    # ESI bad request error.
    class BadRequestError < ClientError; end

    # ESI forbidden error.
    class ForbiddenError < ClientError; end

    # ESI not found error.
    class NotFoundError < ClientError; end

    # ESI unprocessable entity error.
    class UnprocessableEntityError < ClientError; end

    # ESI error limited error.
    class ErrorLimitedError < ClientError; end

    # ESI internal server error.
    class InternalServerError < ClientError; end

    # ESI service unavailable error.
    class ServiceUnavailableError < ClientError; end

    # ESI gateway timeout error.
    class GatewayTimeoutError < ClientError; end

    # ESI EVE server error.
    class EveServerError < ClientError; end
  end
end
