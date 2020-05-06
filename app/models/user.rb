class User < ApplicationRecord
    has_secure_password
    has_many :bookmarks
    has_many :comments, through: :bookmarks
    validates :username, uniqueness: {case_sensitive: false}
end
