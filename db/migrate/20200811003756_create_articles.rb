class CreateArticles < ActiveRecord::Migration[6.0]
  def change
    create_table :articles do |t|
      t.string :url
      t.string :title
      t.string :img

      t.timestamps
    end
  end
end
