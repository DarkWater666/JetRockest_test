class CreateMatch < ActiveRecord::Migration[5.2]
  def change
    create_table :matches do |t|
      t.references :home_team, null: false
      t.references :away_team, null: false
      t.integer :home_team_goals
      t.integer :away_team_goals

      t.timestamps null: false
    end
  end
end
