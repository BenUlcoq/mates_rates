class AddColumnsToRental < ActiveRecord::Migration[5.2]
  def change
    add_column :rentals, :delivery_fee, :decimal
    add_column :rentals, :price, :integer
    add_column :rentals, :delivery_option, :string
  end
end
