class Genre < ApplicationRecord
    has_many :posts
    has_many :post_genres
    has_many :posts, through: :post_genres
    has_one_attached :genre_image
    
    validate :genre_image_format

  def display_image
    genre_image.variant(resize_to_limit: [300, 300]).processed
  end

  private

  def genre_image_format
    return unless genre_image.attached?

    if genre_image.blob.byte_size > 1.megabyte
      errors.add(:genre_image, "is too large. Please upload an image smaller than 1MB.")
    elsif !genre_image.blob.content_type.starts_with?('image/')
      errors.add(:genre_image, "needs to be an image.")
    end
  end
end
