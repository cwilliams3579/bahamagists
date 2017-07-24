class Event < ApplicationRecord
  mount_uploaders :images, ImageUploader
  extend FriendlyId
  friendly_id :title, use: :slugged

  belongs_to :user
  validates :title, presence: true, length: { in: 5..50 }
  validates :address, presence: true
  validates :description, presence: true, length: { in: 10..500 }
  validates :start_date, :end_date, presence: true
end
