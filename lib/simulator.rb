Dir[File.join('aggregates', 'matches', '**/*_chance.rb')].each { |file| require File.expand_path(file) }

class Simulator
  class << self
    delegate :run, to: :new
  end

  def run(match: nil, result: false, target: nil)
    return pick unless match || result || target
    return "#{pick} : #{pick}" if result
    return pick(target) if target

    match.update home_team_goals: pick, away_team_goals: pick
  end

  private

  def pick(target = 'score')
    pick = rand
    chances(target).each do |key, weight|
      return key if pick <= weight

      pick -= weight
    end
  end

  def chances(target = 'score')
    "Matches::#{(target + '_chance').camelize}".constantize.values.each_with_object({}) do |chance, normalized|
      normalized[chance[:points]] = chance[:weight] / 100.00
    end
  end
end
