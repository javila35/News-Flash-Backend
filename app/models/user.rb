class User < ApplicationRecord
    has_secure_password
    has_many :bookmarks
    has_many :comments, through: :bookmarks
    has_many :replies, through: :comments
    validates :username, uniqueness: {case_sensitive: false}
    validates :password, length: {in: 8..16}
end
