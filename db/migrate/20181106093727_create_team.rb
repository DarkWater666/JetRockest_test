class CreateTeam < ActiveRecord::Migration[5.2]
  def change
    create_table :clubs do |t|
      t.string :name, null: false
      t.string :service_name, null: false

      t.index %i[name service_name], unique: true
      t.timestamps null: false
    end
  end
end
