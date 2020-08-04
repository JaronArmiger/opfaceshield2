class DropAddressesOrdersTable < ActiveRecord::Migration[6.0]
  def change
  	drop_table "addresses_orders", id: false, force: :cascade do |t|
	    t.bigint "address_id"
	    t.bigint "order_id"
	    t.index ["address_id"], name: "index_addresses_orders_on_address_id"
	    t.index ["order_id"], name: "index_addresses_orders_on_order_id"
	  end
  end
end
