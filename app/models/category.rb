class Category < ApplicationRecord
  extend FriendlyId
  friendly_id :name, use: :slugged
  
  has_many :job_categories, dependent: :destroy
  has_many :jobs, through: :job_categories, dependent: :destroy
  has_many :events, dependent: :destroy
  validates :name, presence: true, length: {in: 5..50}
  validates_uniqueness_of :name
end

