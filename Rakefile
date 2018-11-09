# Suppress Sinatra's ActiveSupport warn by tricking it into thinking ActiveSupport's Hash extensions are already loaded
# TODO: Remove once the Sintra resolves the issue: https://github.com/sinatra/sinatra/issues/1476
$LOADED_FEATURES << 'fake/active_support/core_ext/hash'
require 'dotenv/load'
require 'sinatra/activerecord'
require 'sinatra/activerecord/rake'
require 'rspec/core/rake_task'
require_relative 'config/application'

RSpec::Core::RakeTask.new

task default: :spec
task test: :spec

desc 'Start a console'
task :console do
  ENV['RACK_ENV'] ||= 'development'
  %w[irb irb/completion].each { |r| require r }
  require 'awesome_print'
  require 'hirb'
  AwesomePrint.irb! if defined? ::AwesomePrint
  Hirb.enable if defined? ::Hirb

  ARGV.clear
  IRB.start
end
