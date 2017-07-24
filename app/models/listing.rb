class Listing < ApplicationRecord
  extend FriendlyId
  friendly_id :title, use: [:slugged, :finders]
  searchkick callbacks: :async
  mount_uploaders :images, ImageUploader
  serialize :images#, JSON # If you use SQLite, add this line.
  belongs_to :user
  has_many :favorites, as: :favorited
  has_many :favorite_listings, through: :favorites, source: :user
  
  private
    def image_size
      if images.size > 10.megabytes
        errors.add(:images, "Should be less than 10MB")
      end
    end
end
