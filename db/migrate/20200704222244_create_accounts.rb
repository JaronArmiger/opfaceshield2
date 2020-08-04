class CreateAccounts < ActiveRecord::Migration[6.0]
  def change
    create_table :accounts do |t|
      t.string :institution_name
      t.string :institution_type
      t.string :contact_first_name
      t.string :contact_last_name
      t.bigint :phone_number

      t.timestamps
    end
  end
end
