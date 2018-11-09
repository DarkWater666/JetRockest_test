class HomeController < ApplicationController
  set :prefix, '/'

  get '/' do
    title 'Home Page'
    @rates = Rate.all
    @stat_attr = Statistic.column_names - %w[id created_at updated_at player_id match_id]
    slim :home
  end
end
