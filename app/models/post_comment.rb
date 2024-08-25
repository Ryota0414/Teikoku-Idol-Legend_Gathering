class PostComment < ApplicationRecord
  belongs_to :user
  belongs_to :post
  belongs_to :parent, class_name: 'PostComment', optional: true # 親コメント
  has_many :replies, class_name: 'PostComment', foreign_key: :parent_id, dependent: :destroy # 返信コメント

  validates :comment, presence: true
end
