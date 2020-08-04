class CreateOrders < ActiveRecord::Migration[6.0]
  def change
    create_table :orders do |t|
      t.integer :num_shields
      t.integer :num_adjusters
      t.text :message

      t.timestamps
    end
  end
end
