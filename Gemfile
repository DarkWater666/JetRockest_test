# Gemfile
source 'https://rubygems.org'
ruby '2.5.1'

# application
gem 'active_interaction', '~> 3.6'
gem 'activerecord'
gem 'dentaku'
gem 'dotenv'
gem 'json'
gem 'rake'
gem 'sinatra'
gem 'sinatra-activerecord'
gem 'sinatra-contrib'
gem 'slim'
gem 'sqlite3'

# server
gem 'puma'
gem 'shotgun'

# api builders
# gem 'rack-cors', require: 'rack/cors'
# gem 'grape'
# gem 'grape-entity'

# test
group :test do
  gem 'database_cleaner'
  gem 'factory_bot'
  gem 'rack-test'
  gem 'rspec'
end

# debug
group :development do
  gem 'byebug'
  gem 'faker', git: 'https://github.com/stympy/faker.git', branch: 'master'
  gem 'listen'
  gem 'rails_best_practices'
end

# guards
group :development do
  gem 'guard', require: false
  gem 'guard-bundler', require: false
  gem 'guard-rails_best_practices', github: 'logankoester/guard-rails_best_practices'
  gem 'guard-rspec', require: false
  gem 'guard-rubocop', require: false
  gem 'guard-shell'
  gem 'rubocop', require: false
  gem 'rubocop-rspec', require: false
  gem 'rubycritic', require: false
  gem 'terminal-notifier'
  gem 'terminal-notifier-guard'
end

# console
group :console do
  gem 'awesome_print'
  gem 'hirb', github: 'bogdan/hirb', branch: 'render-nils'
end
