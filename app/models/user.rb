class User < ApplicationRecord
    has_secure_password
    has_many :bookmarks
    validates :username, uniqueness: {case_sensitive: false}
end
