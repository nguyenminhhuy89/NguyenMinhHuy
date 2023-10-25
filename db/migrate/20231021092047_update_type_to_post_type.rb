class UpdateTypeToPostType < ActiveRecord::Migration[7.1]
  def change
    rename_column :posts, :type, :post_type_id
  end
end
