class Tagging < ApplicationRecord
  belongs_to :event
  belongs_to :tag
  belongs_to :post
end
