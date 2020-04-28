class User < ApplicationRecord
    has_secure_password
    has_many :bookmarks
    validates :username, uniqueness: {case_sensitive: false}
    validates :password, length: {in: 8..16}
end
