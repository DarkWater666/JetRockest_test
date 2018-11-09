require File.expand_path(File.join('aggregates', 'aggregates'))

module Matches
  class ScoreChance < Aggregates
    VALUES = [
      { points: 0, weight: 35 },
      { points: 1, weight: 25 },
      { points: 2, weight: 20 },
      { points: 3, weight: 10 },
      { points: 4, weight: 5 },
      { points: 5, weight: 3 },
      { points: 6, weight: 1 },
      { points: 7, weight: 1 }
    ].freeze
  end
end
