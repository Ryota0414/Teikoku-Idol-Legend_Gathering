class Like < ApplicationRecord
  belongs_to :user
  belongs_to :post

  # ユーザーが1つの投稿に対して一度しか「いいね」を付けられないようにする
  validates :user_id, uniqueness: { scope: :post_id }
end
