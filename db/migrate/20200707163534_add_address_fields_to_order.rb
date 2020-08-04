class AddAddressFieldsToOrder < ActiveRecord::Migration[6.0]
  def change
  	add_column :orders, :street_address, :string
  	add_column :orders, :city, :string
  	add_column :orders, :state, :string
  	add_column :orders, :zipcode, :integer
  end
end
