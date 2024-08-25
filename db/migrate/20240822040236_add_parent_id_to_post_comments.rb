class AddParentIdToPostComments < ActiveRecord::Migration[6.1]
  def change
    add_column :post_comments, :parent_id, :integer
    add_index :post_comments, :parent_id
  end
end
