require 'sinatra/activerecord'

class Club < ActiveRecord::Base
  has_many :players

  validates :name, presence: true
end
