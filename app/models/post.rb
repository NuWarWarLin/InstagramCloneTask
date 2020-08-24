class Post < ApplicationRecord
    belongs_to :user
    mount_uploader :picture, PictureUploader
    validates :name, presence: true, length: { minimum: 10, maximum: 63206 }
end