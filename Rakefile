# frozen_string_literal: true

require "bundler/gem_tasks"
require "rspec/core/rake_task"

RSpec::Core::RakeTask.new(:spec)

require "rubocop/rake_task"

RuboCop::RakeTask.new

task default: %i[spec rubocop]

task :set_version do
  version_file = File.join(File.dirname(__FILE__), "lib/esi/version.rb")
  version_content = File.read(version_file)
  new_version = ENV["VERSION"]
  new_content = version_content.gsub(/VERSION = ".+"/m, "VERSION = \"#{new_version}\"")
  File.write("lib/esi/version.rb", new_content)
end
