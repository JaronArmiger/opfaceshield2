class AddAccountRefToAddresses < ActiveRecord::Migration[6.0]
  def change
  	add_reference :addresses, :account, foreign_key: true
  	change_column_null :addresses, :account_id, false
  end
end
