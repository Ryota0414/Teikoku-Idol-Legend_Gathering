class Genre < ApplicationRecord
  has_many :posts
  has_many :post_genres
  has_many :posts, through: :post_genres
  has_one_attached :genre_image

  # バリデーション
  validates :name, presence: true
  validates :body, presence: true
  validates :genre_image, presence: true
  validate :genre_image_format

  def display_image
    genre_image.variant(resize_to_limit: [300, 300]).processed
  end

  private

  def genre_image_format
    return unless genre_image.attached?

    if genre_image.blob.byte_size > 1.megabyte
      errors.add(:genre_image, "は1MB未満の画像でなければなりません。")
    elsif !genre_image.blob.content_type.starts_with?('image/')
      errors.add(:genre_image, "は画像でなければなりません。")
    end
  end
end
