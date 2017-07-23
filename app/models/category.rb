class Category < ApplicationRecord
  has_many :job_categories, dependent: :destroy
  has_many :jobs, through: :job_categories, dependent: :destroy
  validates :name, presence: true, length: {in: 3..50}
  validates_uniqueness_of :name
end
