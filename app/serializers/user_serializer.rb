class UserSerializer
  include FastJsonapi::ObjectSerializer
  attributes :username, 
    :first_name, 
    :location, 
    :bio
  has_many :bookmarks
  has_many :comments, through: :bookmarks
end
