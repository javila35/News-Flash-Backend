class UserSerializer
  include FastJsonapi::ObjectSerializer
  attributes :username, 
    :first_name, 
    :location, 
    :bio,
    :bookmarks
end
