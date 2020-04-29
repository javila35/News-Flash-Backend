class Bookmark < ApplicationRecord
  belongs_to :user
  has_many :comments
  has_many :replies, through: :comments
end
