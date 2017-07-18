class Category < ApplicationRecord
     has_many :job_categories
  has_many :jobs, through: :job_categories
  validates :name, presence: true, length: {in: 3..25}
  validates_uniqueness_of :name
end
