class CreateRates < ActiveRecord::Migration[5.2]
  def change
    create_table :rates do |t|
      t.string :name, null: false
      t.string :stat, null: false
      t.string :value, null: false

      t.timestamps null: false
    end
  end
end
