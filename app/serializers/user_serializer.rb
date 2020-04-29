class UserSerializer
  include FastJsonapi::ObjectSerializer
  attributes :username, 
    :first_name, 
    :location, 
    :twitter, 
    :website, 
    :bio,
    :user_img
  has_many :bookmarks
  has_many :comments, through: :bookmarks
  has_many :replies, through: :comments
end
