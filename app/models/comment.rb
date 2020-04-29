class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :bookmark
  has_many :replies
end
