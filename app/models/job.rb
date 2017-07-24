class Job < ApplicationRecord
  searchkick callbacks: :async
  mount_uploader :image, ImageUploader
  # extend FriendlyId
  # friendly_id :title, use: [:slugged, :finders]


  validates :company, :url, :description, presence: true
  validates :title, presence: true, length: {minimum: 3, maximum: 50}
  validates :description, presence: true, length: {minimum: 10}
  validates :user_id, presence: true
  
  belongs_to :user
  
  has_many :reviews, dependent: :destroy
  has_many :job_categories
  has_many :categories, through: :job_categories
  has_many :favorites, as: :favorited
  has_many :favorite_jobs, through: :favorites, source: :user

  default_scope -> { order(updated_at: :desc) }
end
