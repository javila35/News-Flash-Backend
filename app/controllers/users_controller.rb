class UsersController < ApplicationController
    skip_before_action :authorized, only: [:create, :show]
    def create
        user = User.new(user_params)
        user.password = params[:password]
        user.save
        render json: user
    end

    def show
        user = User.find_by(username: params["id"]);
        # bookmarks = Bookmark.find_by(user_id: user.id)
        # returnObject = {
        #     username: user.username,
        #     first_name: user.first_name,
        #     location: user.location,
        #     twitter: user.twitter,
        #     website: user.website,
        #     bio: user.bio,
        #     bookmarks: user.bookmarks,
        #     discussions: user.comments
        # };
        # render json: returnObject;
        options = {
            include: [:bookmarks, :comments, :replies]
        }
        render json: UserSerializer.new(user, options)
    end

    private
    def user_params
        params.require(:user).permit(:username, :password)
    end
end
