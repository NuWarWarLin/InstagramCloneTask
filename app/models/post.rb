class Post < ApplicationRecord
    belongs_to :user
    mount_uploader :picture, PictureUploader
    validates :name, presence: true, length: { minimum: 10, maximum: 63206 }
    has_many :favorites, dependent: :destroy
    has_many :favorite_users, through: :favorites, source: :user
end