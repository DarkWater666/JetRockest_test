require 'sinatra/activerecord'

class Match < ActiveRecord::Base
  belongs_to :home_team, class_name: 'Club', foreign_key: 'home_team_id'
  belongs_to :away_team, class_name: 'Club', foreign_key: 'away_team_id'
  has_many :statistics

  scope :unplayed, -> { where home_team_goals: nil, away_team_goals: nil }

  alias_attribute :first_team, :home_team
  alias_attribute :second_team, :away_team
  alias_attribute :first_club, :home_team
  alias_attribute :second_club, :away_team
  alias_attribute :result, :score

  delegate :id, to: :first_team, prefix: true
  delegate :id, to: :second_team, prefix: true

  def finished?
    !(away_team_goals.nil? && home_team_goals.nil?)
  end

  def players
    Player.where(club: [home_team, away_team])
  end
end
