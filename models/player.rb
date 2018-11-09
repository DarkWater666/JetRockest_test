require 'sinatra/activerecord'

class Player < ActiveRecord::Base
  belongs_to :club

  validates :name, presence: true

  def self.order_by_ids(ids)
    order_by = ['CASE', ids.each_with_index.map { |id, index| "WHEN id='#{id}' THEN #{index}" }, 'END'].join(' ')
    order_by = 'id' if ids.blank?

    order Arel.sql(order_by)
  end
end
