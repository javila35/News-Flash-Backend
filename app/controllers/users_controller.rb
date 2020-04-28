class UsersController < ApplicationController
    def show
        user = User.find_by(username: params["id"]);
        bookmarks = Bookmark.find_by(user_id: user.id)
        returnObject = {
            username: user.username,
            first_name: user.first_name,
            location: user.location,
            twitter: user.twitter,
            website: user.website,
            bio: user.bio
        };
        render json: returnObject;
    end
end
