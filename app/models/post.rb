class Post < ApplicationRecord
    belongs_to :user
    # belongs_to :genre
    has_many :post_comments, dependent: :destroy
    has_many :post_genres
    has_many :genres, through: :post_genres
    has_many :likes, dependent: :destroy
    has_many :liked_users, through: :likes, source: :user
    has_many_attached :images
    validates :title, presence: true
    validates :body, presence: true
    def self.looks(search, word)
        if search == "perfect_match"
          @post = Post.where("title LIKE?","#{word}")
        elsif search == "forward_match"
          @post = Post.where("title LIKE?","#{word}%")
        elsif search == "backward_match"
          @post = Post.where("title LIKE?","%#{word}")
        elsif search == "partial_match"
          @post = Post.where("title LIKE?","%#{word}%")
        else
          @post = Post.all
        end
    end
    
    private

    def image_count_within_limit
      if images.size > 4
        errors.add(:images, "は4枚までアップロードできます")
      end
    end
end
