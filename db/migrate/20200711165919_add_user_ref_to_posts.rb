class AddUserRefToPosts < ActiveRecord::Migration[6.0]
  def change
  	add_reference :posts, :user, foreign_key: true
  	change_column_null :posts, :user_id, false
  end
end
