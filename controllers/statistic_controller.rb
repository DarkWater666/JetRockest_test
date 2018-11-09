class StatisticController < ApplicationController
  set :prefix, '/statistic'

  get '/:id' do |id|
    title 'Statistic by rate'
    club_id = params['club_id']

    @rate = Rate.find_by(id: id) || Rate.first
    @clubs = Club.all.load
    query = QueryGenerator.run(rate: @rate).result
    query = query.joins(:player).where(players: { club_id: club_id }) if club_id.present? && club_id.to_i != 0

    ids = query.map(&:player_id)
    @total = ids.size
    ids = ids.first(10)

    @players = Player.where(id: ids).order_by_ids(ids).load

    slim :rate_show
  end
end
