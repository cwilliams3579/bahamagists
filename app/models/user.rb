class User < ApplicationRecord
  has_many :favorites
  has_many :favorite_jobs, through: :favorites, source: :favorited, source_type: 'Job'

  has_many :comments, dependent: :destroy
  has_many :posts, dependent: :destroy
  has_many :jobs, dependent: :destroy
  mount_uploader :image, ImageUploader
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  def full_name
   self.first_name + " " + self.last_name
  end
end
