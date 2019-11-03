class CreateTools < ActiveRecord::Migration[5.2]
  def change
    create_table :tools do |t|
      t.integer :price
      t.string :name
      t.string :brand
      t.string :model
      t.text :description
      t.boolean :availability
      t.string :delivery_options
      t.decimal :delivery_fee, precision: 5, scale: 2
      t.decimal :min_delivery_fee, precision: 7, scale: 2
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
