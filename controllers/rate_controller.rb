class RateController < ApplicationController
  set :prefix, '/rates'

  post '/' do
    formula = params['formula']
    value = params['value']
    if value.include?('%')
      value = value.delete!('%').split(/(\d+)/).map { |char| char.numeric? ? (char.to_f / 100) : char }.join('')
    end
    Rate.create name: params['name'], stat: formula.join(' '), value: value if formula.present?
    redirect request.referer
  end
end

class String
  def numeric?
    match(/\A[+-]?\d+?(_?\d+)*(\.\d+e?\d*)?\Z/) != nil
  end
end
