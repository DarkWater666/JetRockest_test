require 'rubygems'
require 'sinatra'
require 'sinatra/base'
require 'sinatra/reloader'
require 'json'
require 'slim'
require File.expand_path(File.join('helpers', 'application_helper'))
require File.expand_path(File.join('controllers', 'application_controller'))
Dir[File.join('helpers', '**/*_helper.rb')].each { |file| require File.expand_path(file) }
Dir[File.join('models', '**/*.rb')].each { |file| require File.expand_path(file) }
Dir[File.join('interactions', '**/*.rb')].each { |file| require File.expand_path(file) }

class Application
  attr_reader :app
  delegate :call, to: :app

  def initialize
    @app = Rack::Builder.app do
      Dir[File.join('controllers', '**/*_controller.rb')].select { |f| File.file? f }.each do |file_path|
        require File.expand_path(file_path)
        file = File.basename(file_path, '.rb').titleize.delete(' ')
        next if file == 'ApplicationController'

        controller = file.constantize
        map(controller.prefix) { run(controller.new) }
      end
    end
  end
end
