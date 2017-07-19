class Post < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy
  default_scope -> { order(updated_at: :desc) }
  mount_uploader :image, ImageUploader
  validates :user_id, presence: true
end
