class AddUniqeTitlePost < ActiveRecord::Migration[7.1]
  def change
    add_index :posts, :title, unique: true
  end
end
