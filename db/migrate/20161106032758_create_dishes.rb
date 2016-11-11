class CreateDishes < ActiveRecord::Migration[5.0]
  def change
    create_table :dishes do |t|
      t.string :restaurant
      t.string :location
      t.integer :cost
      t.string :name
      t.text :ingredient

      t.timestamps
    end
  end
end
