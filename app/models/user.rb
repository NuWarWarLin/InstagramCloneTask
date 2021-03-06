class User < ApplicationRecord
    before_save { self.email = email.downcase }
    mount_uploader :profile, ProfileUploader
    validates :username, presence: true, 
                    uniqueness: { case_sensitive: false }, 
                    length: { minimum: 3, maximum: 25 }
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
    validates :email, presence: true, 
                    uniqueness: { case_sensitive: false }, 
                    length: { maximum: 105 },
                    format: { with: VALID_EMAIL_REGEX }
    has_secure_password
    has_many :posts, dependent: :destroy
    has_many :favorites, dependent: :destroy
    has_many :favorite_posts, through: :favorites, source: :post
end