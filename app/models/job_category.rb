class JobCategory < ApplicationRecord
  searchkick
  belongs_to :job
  belongs_to :category
end
