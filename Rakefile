# frozen_string_literal: true

require 'bundler/gem_tasks'
require 'yard'
require 'yard/rake/yardoc_task'
require 'rspec/core/rake_task'

RSpec::Core::RakeTask.new(:spec)

require 'rubocop/rake_task'

RuboCop::RakeTask.new

YARD::Rake::YardocTask.new(:doc)

task default: %i[spec rubocop]

task :set_version do
  version_file = File.join(File.dirname(__FILE__), 'lib/esi/version.rb')
  version_content = File.read(version_file)
  new_version = ENV['VERSION']
  new_content = version_content.gsub(/VERSION = '.+'/m, "VERSION = \"#{new_version}\"")
  File.write('lib/esi/version.rb', new_content)
end

task :generate do
  require 'active_support/core_ext/string/inflections'
  require 'json'
  require 'open-uri'

  swagger = JSON.parse(URI.open('https://esi.evetech.net/latest/swagger.json').read)

  paths = swagger['paths']
  all_operations = paths.each_with_object({}) do |(path, operations), h|
    operations.each do |(http_method, operation)|
      description = operation['description'].split("\n").first.strip

      method_name_parts = path.split('/').map { |p| p.gsub(/[{}]/, '') }.map { |p| p.gsub(/_id/, '') }
      operation_name = operation['operationId']
      method_name_parts.map! do |p|
        if [(method_name_parts[method_name_parts.index(p) + 1]).to_s,
            "#{method_name_parts[method_name_parts.index(p) + 1]}s", ''].include?(p)
          nil
        else
          p
        end
      end
      method_name_parts.map! do |p|
        next unless p

        next_part = method_name_parts[method_name_parts.index(p) + 1]
        if !next_part || (next_part && next_part.singularize == next_part)
          p
        else
          p.singularize
        end
      end
      method_name = "#{http_method}_#{method_name_parts.compact.join('_')}"

      path_params = operation['parameters'].select { |p| p['in'] == 'path' || p['$ref'] }
      path_params.map! do |param|
        if param['$ref']
          ref_name = param['$ref'].match(%r{#/parameters/(alliance_id|corporation_id|character_id)})
          ref_name = ref_name[1] if ref_name

          next unless ref_name

          swagger['parameters'][ref_name]
        else
          param
        end
      end
      path_params.compact!.sort_by! { |p| p['name'] }

      body_param = operation['parameters'].select { |p| p['in'] == 'body' }.first

      tag = operation['tags'].first || 'Untagged'
      operation[tag]

      scopes = (operation['security'].first['evesso'] if operation['security'].present?)

      cache = operation['x-cached-seconds']
      errors = operation['responses'].reject { |(k, _)| %w[200 201 204 304].include?(k) }
      versions = operation['x-alternate-versions']

      query = operation['parameters'].select { |p| p['in'] == 'query' }

      h[method_name] =
        { params: path_params, method: http_method, description: description, tag: tag, path: path,
          name: operation_name, body: body_param, scopes: scopes, cache: cache, versions: versions, errors: errors,
          responses: operation['responses'], query: query }
    end
  end

  method_aliases = {
    'get_killmail_killmail_hash' => 'get_killmail',
    'get_markets_groups_market_group' => 'get_market_group',
    'get_markets_groups' => 'get_market_groups',
    'get_character_corporationhistory' => 'get_character_corporation_history',
    'get_corporation_alliancehistory' => 'get_corporation_alliance_history'
  }

  error_mapping = {
    400 => 'ESI::Errors::BadRequestError',
    401 => 'ESI::Errors::UnauthorizedError',
    403 => 'ESI::Errors::ForbiddenError',
    404 => 'ESI::Errors::NotFoundError',
    420 => 'ESI::Errors::ErrorLimitedError',
    422 => 'ESI::Errors::UnprocessableEntityError',
    500 => 'ESI::Errors::InternalServerError',
    503 => 'ESI::Errors::ServiceUnavailableError',
    504 => 'ESI::Errors::GatewayTimeoutError',
    520 => 'ESI::Errors::EveServerError'
  }.freeze

  all_operations.group_by { |(_, v)| v[:tag] }.each do |(tag, operations)|
    lib_filename = "#{tag.gsub(/ /, '_').underscore}.rb"
    module_name = tag.gsub(/ /, '_').classify
    method_definitions = operations.sort_by { |(k, _v)| k }.each_with_object([]) do |(method_name, operation), a|
      signature_params = operation[:params].map { |p| "#{p['name']}:" }
      raw_call_params = operation[:params].map { |p| "#{p['name']}: #{p['name']}" }

      description = "# #{operation[:description]}"
      description = "#{description}." unless description.end_with?('.')
      description += "\n"

      description += "#\n\n# This endpoint is cached for up to #{operation[:cache]} seconds.\n" if operation[:cache]

      if operation[:scopes]
        description += "#\n"
        description += "# This endpoint requires authorization (see {ESI::Client#authorize}).\n#\n"
        scope_tags = operation[:scopes].map { |s| "# @esi_scope #{s}" }
        description += scope_tags.join("\n")
        description += "\n"
      end

      if operation[:versions]
        description += "#\n"
        description += operation[:versions].map { |v| "# @esi_version #{v}" }.join("\n")
        description += "\n"
      end

      param_tags = operation[:params].map do |p|
        "# @param #{p['name']} [#{p['type'].capitalize}] #{p['description']}"
      end

      if operation[:body]
        body_param = operation[:body]
        body_name = body_param['name']
        body_type =
          case body_param['schema']['type']
          when 'array'
            'Array'
          when 'object'
            'Hash'
          end

        signature_params << "#{body_name}:"
        raw_call_params << "#{body_name}: #{body_name}"
        param_tags += ["# @param #{body_name} [#{body_type}] #{body_param['description']}"]
      end

      operation[:query]&.each do |p|
        p_tag = "# @param #{p['name']} [#{p['type'].capitalize}] "
        p_tag += (p['description']).to_s
        p_tag += ". Must be one of: #{p['enum'].map { |e| "`#{e}`" }.join(', ')}" if p['enum']
        p_str = if p['default'] && p['type'] == 'integer'
                  "#{p['name']}: #{p['default']}"
                elsif p['default'] && p['type'] == 'string'
                  "#{p['name']}: \"#{p['default']}\""
                elsif !p['required']
                  "#{p['name']}: nil"
                else
                  "#{p['name']}:"
                end
        signature_params << p_str
        raw_call_params << "#{p['name']}: #{p['name']}"
        param_tags << p_tag
      end

      signature_params += %w[headers params].map do |p|
        "#{p}: {}"
      end
      raw_call_params += %w[headers params].map do |p|
        "#{p}: #{p}"
      end
      param_tags << '# @param params [Hash] Additional query string parameters'

      param_tags += [
        '# @param headers [Hash] Additional headers'
      ]
      description += "#\n"
      description += param_tags.join("\n")
      description += "\n"

      description += "#\n"
      raise_tags = operation[:errors].map do |(e, v)|
        "# @raise [#{error_mapping[e.to_i]}] #{v['description']}"
      end
      description += raise_tags.join("\n")
      description += "\n"

      description += "#\n"
      description += "# @see https://esi.evetech.net/ui/#/#{operation[:tag]}/#{operation[:name]}"
      description.gsub!(/^$\n/m, '')

      signature = "(#{signature_params.join(', ')})"
      raw_call = "(#{raw_call_params.join(', ')})"
      path_parts = operation[:path].split('/')
      path_parts.map! do |p|
        if p =~ /\{\w+\}/
          "##{p}"
        else
          p
        end
      end
      path = "#{path_parts.join('/')}/"

      http_call_params = %w[headers params].map { |p| "#{p}: #{p}" }
      http_call_params << ("payload: #{body_param['name']}" if operation[:body])

      params_merge = if operation[:query].any?
                       "params.merge!(#{operation[:query].map { |q| "'#{q['name']}' => #{q['name']}" }.join(', ')})"
                     else
                       ''
                     end

      http_call = "#{operation[:method]}(\"#{path}\", #{http_call_params.join(', ')})"

      alias_methods = if method_aliases[method_name]
                        Array(method_aliases[method_name]).sort.map do |alias_name|
                          ["alias_method :#{alias_name}, :#{method_name}"]
                        end
                      else
                        []
                      end
      alias_methods << "alias_method :#{operation[:name]}, :#{method_name}" unless operation[:name] == method_name
      alias_methods = alias_methods.join("\n")

      if operation[:responses]['200'] && operation[:responses]['200']['headers'] && operation[:responses]['200']['headers'].key?('X-Pages')
        a << <<~METHOD_DEFINITION
          #{description}
          def #{method_name}#{signature}
            #{params_merge}
            concat_responses(#{method_name}_raw#{raw_call})
          end
          #{alias_methods}

          #{description}
          def #{method_name}_raw#{signature}
            #{params_merge}
            #{http_call}
          end
        METHOD_DEFINITION
      else
        a << <<~METHOD_DEFINITION
          #{description}
          def #{method_name}#{signature}
            parse_response(#{method_name}_raw#{raw_call})
          end
          #{alias_methods}

          #{description}
          def #{method_name}_raw#{signature}
            #{params_merge}
            #{http_call}
          end
        METHOD_DEFINITION
      end
    end

    lib_content = <<~MODULE_DEFINITION
      # frozen_string_literal: true

      module ESI
        class Client
          # ESI #{tag.downcase} operations.
          module #{module_name}
            #{method_definitions.join("\n\n")}
          end
        end
      end
    MODULE_DEFINITION

    File.write(File.join("lib/esi/client/#{lib_filename}"), lib_content)

    spec_filename = "#{tag.gsub(/ /, '_').underscore}_spec.rb"
    spec_path = File.join("spec/lib/esi/client/#{spec_filename}")

    describe_blocks = operations.sort_by { |(k, _v)| k }.each_with_object([]) do |(method_name, operation), a|
      success_path = operation[:path].gsub(/\{\w+\}/, '1234567890')
      success_response = operation[:responses].find { |(k, _)| k.start_with?('20') }
      success_code = success_response.first
      success_desc = success_response.last

      success_response_body = case success_code
                              when '204'
                                'nil'
                              else
                                success_desc['examples']['application/json'].inspect
                              end

      success_params = operation[:params].map { |p| "#{p['name']}: \"1234567890\"" }
      success_params += operation[:query].map { |p| "#{p['name']}: \"1234567890\"" }

      if operation[:body]
        body_param = operation[:body]
        body_name = body_param['name']
        body_value =
          case body_param['schema']['type']
          when 'array'
            '[1, 2, 3]'
          when 'object'
            '{ "foo" => "bar" }'
          end
        success_params << "#{body_name}: #{body_value}"
      end

      with_query = operation[:query].any? ? ".with(query: { #{operation[:query].map { |p| "#{p['name']}: \"1234567890\"" }.join(', ')} })" : ''

      extra_headers = success_desc['headers'] && success_desc['headers']['X-Pages'] ? ", 'X-Pages': '1'" : ''

      describe =  "  describe \"##{method_name}\" do\n"
      describe += "    context \"when the response is #{success_code}\" do\n"
      describe += "      let(:response) { #{success_response_body} }\n"
      describe += "\n"
      describe += "      before do\n"
      describe += "        stub_request(:#{operation[:method]}, \"https://esi.evetech.net/latest#{success_path}\")#{with_query}.to_return(body: response.to_json, headers: { 'Content-Type': 'application/json'#{extra_headers} })\n"
      describe += "      end\n"
      describe += "\n"
      describe += "      it \"returns the response\" do\n"
      describe += "        expect(client.#{method_name}(#{success_params.join(', ')})).to eq(response)\n"
      describe += "      end\n"
      describe += "    end\n"
      describe += '  end'
      a << describe
    end

    spec_content = <<~SPEC_FILE
      # frozen_string_literal: true

      RSpec.describe ESI::Client::#{module_name}, type: :stub do
        subject(:client) { ESI::Client.new(retries: 2, user_agent: \"esi-sdk-ruby Tests/1.0; +(https://github.com/bokoboshahni/esi-sdk-ruby)\") }

      #{describe_blocks.join("\n\n")}
      end
    SPEC_FILE

    File.write(spec_path, spec_content)
  end

  Rake::Task['rubocop:auto_correct'].invoke
end
