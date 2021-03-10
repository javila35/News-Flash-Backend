class UserSerializer
  include FastJsonapi::ObjectSerializer
  attributes :username, 
    :id,
    :first_name, 
    :location, 
    :bio,
    :bookmarks
end
