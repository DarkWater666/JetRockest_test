require File.expand_path(File.join('aggregates', 'aggregates'))

module Matches
  class YellowCardChance < Aggregates
    VALUES = [
      { points: 0, weight: 80 },
      { points: 1, weight: 17 },
      { points: 2, weight: 3 }
    ].freeze
  end
end
