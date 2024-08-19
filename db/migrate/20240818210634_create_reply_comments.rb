class CreateReplyComments < ActiveRecord::Migration[6.1]
  def change
    create_table :reply_comments do |t|

      t.timestamps
    end
  end
end
