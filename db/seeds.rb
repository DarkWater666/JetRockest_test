require 'faker'
require File.expand_path(File.join('lib', 'simulator'))

def prompt(args)
  puts args
  puts ''
  STDIN.gets.chomp
end

NUMBER = prompt('What is the maximum clubs amount you want to generate?').to_i

def initial_stats
  player_passes = rand(5..50)
  {
    minutes: rand(25.0..95.0).round(2),
    ran: rand(1.5..15.0).round(2),
    fouls: rand(0..5),
    offsides: Simulator.run(target: 'offside'),
    yellow_cards: Simulator.run(target: 'yellow_card'),
    red_cards: Simulator.run(target: 'red_card'),
    passes: player_passes,
    accurate_passes: (player_passes * rand).round
  }
end

def match_stats_by_team(player, match)
  match.statistics.where(player: Player.where(club: player.club))
end

def generate_stats(player, match, number)
  goals = (player.club_id == match.home_team_id ? match.home_team_goals : match.away_team_goals).to_i
  already_scored = match_stats_by_team(player, match).sum(:goals).to_i
  rest_goals = goals - already_scored
  player_possible_goals = rand(0..rest_goals)
  last_goals = number == match.players.count ? rest_goals : 0
  player_goals = player_possible_goals <= rest_goals ? player_possible_goals : last_goals
  player_assists = goals - player_goals - match_stats_by_team(player, match).sum(:assists).to_i
  Statistic.create initial_stats.merge(
    player: player,
    match: match,
    shots: player_goals + rand(0..5),
    goals: player_goals,
    assists: player_assists >= 0 ? player_assists : 0
  )
end

puts 'Generating in process: clubs with players. Wait...'
rand((NUMBER / 2).to_i..NUMBER).times do
  name = Faker::Football.team
  club = Club.create name: name, service_name: name.to_s.downcase.parameterize.underscore
  rand(5..10).times { club.players.create name: Faker::Football.player }
rescue ActiveRecord::RecordNotUnique
  next
end

puts 'Generating in process: matches and statistic. Wait...'
(Club.count * rand(5..10)).times do
  home_team = Club.order(Arel.sql('random()')).take
  away_team = Club.where.not(id: home_team.id).order(Arel.sql('random()')).take
  match = Match.new home_team: home_team, away_team: away_team
  Simulator.run match: match
  [home_team.players, away_team.players].each do |players|
    players.shuffle.each_with_index { |player, index| generate_stats(player, match, index + 1) }
  end
end

Dir[File.join('db', 'seeds', '*.rb')].each { |seed| load seed }
