require File.expand_path(File.join('aggregates', 'aggregates'))

module Matches
  class RedCardChance < Aggregates
    VALUES = [
      { points: 0, weight: 95 },
      { points: 1, weight: 5 }
    ].freeze
  end
end
