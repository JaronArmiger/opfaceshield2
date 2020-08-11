class RenameImgColumn < ActiveRecord::Migration[6.0]
  def change
  	rename_column :articles, :img, :img_src
  end
end
