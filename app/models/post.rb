class Post < ApplicationRecord
    belongs_to :user
    # belongs_to :genre
    has_many :post_comments, dependent: :destroy
    has_many :post_genres
    has_many :genres, through: :post_genres
    has_one_attached :image
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
end
