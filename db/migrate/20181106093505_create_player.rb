class CreatePlayer < ActiveRecord::Migration[5.2]
  def change
    create_table :players do |t|
      t.string :name, null: false, unique: true
      t.belongs_to :club

      t.timestamps null: false
    end
  end
end
