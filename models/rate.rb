require 'sinatra/activerecord'

class Rate < ActiveRecord::Base
  validates :name, :stat, :value, presence: true
end
