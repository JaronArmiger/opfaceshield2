class AddUserRefToAccounts < ActiveRecord::Migration[6.0]
  def change
  	add_reference :accounts, :user, foreign_key: true
  	change_column_null :accounts, :user_id, false
  end
end
