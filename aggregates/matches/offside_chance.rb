require File.expand_path(File.join('aggregates', 'aggregates'))

module Matches
  class OffsideChance < Aggregates
    VALUES = [
      { points: 0, weight: 45 },
      { points: 1, weight: 20 },
      { points: 2, weight: 15 },
      { points: 3, weight: 11 },
      { points: 4, weight: 5 },
      { points: 5, weight: 4 }
    ].freeze
  end
end
