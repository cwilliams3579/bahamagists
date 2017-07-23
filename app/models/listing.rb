class Listing < ApplicationRecord
  mount_uploaders :images, ImageUploader
  belongs_to :user
end
