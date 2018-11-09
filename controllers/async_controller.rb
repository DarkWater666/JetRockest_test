class AsyncController < ApplicationController
  set :prefix, '/async'

  get '/club/:club_id/players' do |club_id|
    content_type :json
    response = {}

    club = Club.find club_id
    players = club.players

    players.each do |player|
      response[player.id] = player.name
    end
    response.to_json
  end

  get '/check/:player_id' do |player_id|
    content_type :json

    rate = Rate.find_by(id: params['rate_id']) || Rate.first
    stats = QueryGenerator.run(rate: rate, only_where: true).result.where(player_id: player_id)
                          .where('minutes > 0').joins(:match).reorder('matches.created_at desc').first(5)
    response = "The player #{stats.present? ? 'did' : 'didn`t'} fulfilled these conditions"

    { result: response }.to_json
  end
end
