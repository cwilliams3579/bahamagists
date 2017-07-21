class Job < ApplicationRecord
  mount_uploader :image, ImageUploader
  belongs_to :user
  has_many :reviews, dependent: :destroy
  has_many :job_categories
  has_many :categories, through: :job_categories
  validates :company, :url, :description, presence: true
  validates :title, presence: true, length: {minimum: 3, maximum: 50}
  validates :description, presence: true, length: {minimum: 10}
  validates :user_id, presence: true
  default_scope -> { order(updated_at: :desc) }

end
