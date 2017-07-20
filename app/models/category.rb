class Category < ApplicationRecord
  has_many :job_categories, dependent: :destroy
  has_many :jobs, through: :job_categories, dependent: :destroy
  validates :name, presence: true, length: {in: 3..25}
  validates_uniqueness_of :name
end
