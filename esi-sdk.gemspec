# frozen_string_literal: true

require_relative "./lib/esi/version"

Gem::Specification.new do |spec|
  spec.name          = "esi-sdk"
  spec.version       = Esi::VERSION
  spec.authors       = ["Bokobo Shahni"]
  spec.email         = ["shahni@bokobo.space"]

  spec.summary       = "API client for the EVE Swagger Interface (ESI)"
  spec.description   = "ESI SDK is a Ruby API client for the EVE Swagger Interface (ESI), "\
                       "the official API for the EVE Online MMORPG."
  spec.homepage      = "https://github.com/bokoboshahni/esi-sdk"
  spec.license       = "MIT"
  spec.required_ruby_version = ">= 3.0.0"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/bokoboshahni/esi-sdk"
  spec.metadata["changelog_uri"] = "https://github.com/bokoboshahni/blob/main/CHANGELOG.md"

  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{\A(?:test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency "faraday", "~> 1.5"
  spec.add_dependency "faraday-http-cache", "~> 2.2"
  spec.add_dependency "faraday_middleware", "~> 1.0"
end
