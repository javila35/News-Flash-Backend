class UsersController < ApplicationController
    def create
        user = User.new(user_params)
        user.password = params[:password]
        user.save
        token = issue_token(user)
        render json: {user: {id: user.id, username: user.username, first_name: user.first_name, location: user.location, twitter: user.twitter, website: user.website}, jwt: token}
    end

    def show
        user = User.find_by(username: params["id"]);
        if user 
            options = {
                include: [:bookmarks, :comments, :replies]
            };
            render json: UserSerializer.new(user, options)
        else
            render json: { errors: 'User not found' }
        end
    end

    def update
        user = User.find(user_params[:id])
        user.update(user_params)
        render json: user
    end

    private
    def user_params
        params.require(:user).permit(:username, :password, :id, :first_name, :twitter, :website, :bio, :location)
    end
end
