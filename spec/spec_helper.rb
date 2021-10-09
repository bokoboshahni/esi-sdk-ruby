# frozen_string_literal: true

require "esi-sdk"

require "simplecov"
require "simplecov_json_formatter"

SimpleCov.formatter = SimpleCov::Formatter::MultiFormatter.new([
                                                                 SimpleCov::Formatter::HTMLFormatter,
                                                                 SimpleCov::Formatter::JSONFormatter
                                                               ])
SimpleCov.start

require "webmock/rspec"
require "httpx/adapters/webmock"

module WebMock
  module HttpLibAdapters
    module Plugin
      module InstanceMethods
        private

        def _build_webmock_request_signature(request) # rubocop:disable Metrics/AbcSize
          request.uri.query = request.query if request.query
          uri = WebMock::Util::URI.heuristic_parse(request.uri)
          uri.path = uri.normalized_path.gsub("[^:]//", "/")

          WebMock::RequestSignature.new(
            request.verb,
            uri.to_s,
            body: request.body.each.to_a.join,
            headers: request.headers.to_h
          )
        end
      end
    end
  end
end

WebMock.disable_net_connect!

require "awesome_print"

RSpec.configure do |config|
  config.disable_monkey_patching!

  config.default_formatter = config.files_to_run.one? ? "doc" : "progress"
  config.example_status_persistence_file_path = ".rspec_status"
  config.order = :random
  config.shared_context_metadata_behavior = :apply_to_host_groups

  config.expect_with :rspec do |expectations|
    expectations.syntax = :expect
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end

  config.around type: :integration do |example|
    WebMock.allow_net_connect!(net_http_connect_on_start: true)
    example.run
    WebMock.disable_net_connect!
  end
end
