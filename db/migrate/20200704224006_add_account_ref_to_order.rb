class AddAccountRefToOrder < ActiveRecord::Migration[6.0]
  def change
  	add_reference :orders, :account, foreign_key: true
  	change_column_null :orders, :account_id, false
  end
end
