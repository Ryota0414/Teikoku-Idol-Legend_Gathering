class CreateReplyComments < ActiveRecord::Migration[6.1]
  def change
    create_table :reply_comments do |t|
      t.text :comment
      t.integer :user_id
      t.integer :comment_id

      t.timestamps
    end
  end
end
