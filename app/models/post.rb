class Post < ApplicationRecord
  attr_accessor :tag_list
  mount_uploader :image, ImageUploader

  extend FriendlyId
  friendly_id :title, use: :slugged

  belongs_to :user
  
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :taggings, dependent: :destroy
  has_many :tags, through: :taggings
  
  validates :user_id, presence: true
  validates :title, presence: true, length: { in: 4..50 }
  validates :content, presence: true, length: { in: 10..1000 }
  
  default_scope -> { order(updated_at: :desc) }
end
