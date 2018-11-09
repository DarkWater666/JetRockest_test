# Suppress Sinatra's ActiveSupport warn by tricking it into thinking ActiveSupport's Hash extensions are already loaded
# TODO: Remove once the Sintra resolves the issue: https://github.com/sinatra/sinatra/issues/1476
$LOADED_FEATURES << 'fake/active_support/core_ext/hash'
require 'dotenv/load'

require File.expand_path(File.join('config', 'application'))

run Application.new
