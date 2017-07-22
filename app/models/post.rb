class Post < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy
  default_scope -> { order(updated_at: :desc) }
  mount_uploader :image, ImageUploader
  validates :user_id, presence: true
  validates :title, presence: true, length: { in: 4..50 }
  validates :content, presence: true, length: { in: 10..1000 }
end
