class CreateStatistics < ActiveRecord::Migration[5.2]
  def change
    create_table :statistics do |t|
      t.float :minutes, null: false, default: 0.0
      t.float :ran, null: false, default: 0.0
      t.float :shots, null: false, default: 0
      t.float :goals, null: false, default: 0
      t.float :assists, null: false, default: 0
      t.float :passes, null: false, default: 0
      t.float :accurate_passes, null: false, default: 0
      t.float :fouls, null: false, default: 0
      t.float :offsides, null: false, default: 0
      t.float :yellow_cards, null: false, default: 0
      t.float :red_cards, null: false, default: 0
      t.belongs_to :player
      t.belongs_to :match

      t.timestamps null: false
    end
  end
end
