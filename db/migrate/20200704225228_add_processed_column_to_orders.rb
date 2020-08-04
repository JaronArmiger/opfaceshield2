class AddProcessedColumnToOrders < ActiveRecord::Migration[6.0]
  def change
  	add_column :orders, :processed, :boolean, default: false
  end
end
