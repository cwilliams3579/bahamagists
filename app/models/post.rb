class Post < ApplicationRecord
  mount_uploader :image, ImageUploader

  extend FriendlyId
  friendly_id :title, use: :slugged

  belongs_to :user
  has_many :comments, dependent: :destroy
  
  validates :user_id, presence: true
  validates :title, presence: true, length: { in: 4..50 }
  validates :content, presence: true, length: { in: 10..1000 }
  
  default_scope -> { order(updated_at: :desc) }
end
