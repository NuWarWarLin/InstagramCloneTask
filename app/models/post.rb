class Post < ApplicationRecord
    belongs_to :user
    mount_uploader :picture, PictureUploader
    validates :description, presence: true, length: { minimum: 10, maximum: 63206 }
end