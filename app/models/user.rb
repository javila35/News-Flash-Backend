class User < ApplicationRecord
  has_secure_password
  has_many :bookmarks, dependent: :delete_all
  has_many :comments, through: :bookmarks, dependent: :delete_all
  validates :username, uniqueness: { case_sensitive: false }
end
