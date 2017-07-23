class Favorite < ApplicationRecord
  belongs_to :user
  belongs_to :favorited, polymorphic: true
  default_scope -> { order(updated_at: :desc) }
end
