class UsersController < ApplicationController

    def create
        user = User.new(user_params)
        user.password = params[:password]
        user.save
        byebug
        render json: user
    end

    def show
        user = User.find_by(username: params["id"]);
        bookmarks = Bookmark.find_by(user_id: user.id)
        returnObject = {
            username: user.username,
            first_name: user.first_name,
            location: user.location,
            twitter: user.twitter,
            website: user.website,
            bio: user.bio,
            bookmarks: user.bookmarks
        };
        render json: returnObject;
    end

    private
    def user_params
        params.require(:user).permit(:username, :password)
    end
end
