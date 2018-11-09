require 'active_interaction'

class QueryGenerator < ActiveInteraction::Base
  object :rate, class: 'Rate'
  boolean :only_where, default: false

  def execute
    return default_query.pluck(:player_id) if operands[:columns].blank?
    return by_sums(operands) if operands[:columns].size > 1

    by_avg(operands)
  end

  private

  def operands
    @operands ||= {
      columns: rate.stat.split(/\W+/).map(&:strip).concat,
      operator: rate.stat.split(/\w+/).reject { |e| e.to_s.empty? }.map(&:strip).first,
      matching: @rate.value
    }
  end

  def default_query
    Statistic.order(created_at: :desc)
  end

  def by_sums(**operands)
    return default_query.pluck(:player_id) if operands[:operator].blank?

    operation = "#{operands[:columns].first}_sum #{operands[:operator]} #{operands[:columns].second}_sum"
    where_by = "#{operands[:columns].first} #{operands[:operator]} #{operands[:columns].second}"
    query = default_query.where("#{where_by} #{operands[:matching]}")
    return query if only_where

    query.select("player_id,
                  SUM(#{operands[:columns].first}) AS #{operands[:columns].first}_sum,
                  SUM(#{operands[:columns].second}) AS #{operands[:columns].second}_sum")
         .smart_group(operation, operands[:matching])
  end

  def by_avg(**operands)
    operation = "#{operands[:columns].first}_avg"
    query = default_query.where("#{operands[:columns].first} #{operands[:matching]}")
    return query if only_where

    query.select("player_id, AVG(#{operands[:columns].first}) AS #{operands[:columns].first}_avg")
         .smart_group(operation, operands[:matching])
  end
end
