require 'sinatra/activerecord'

class Statistic < ActiveRecord::Base
  belongs_to :match
  belongs_to :player

  def self.smart_group(operation, matching, group_by = :player_id)
    group(group_by).having("#{operation} #{matching}").reorder(Arel.sql("#{operation} DESC"))
  end
end
