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
        if user 
            options = {
                include: [:bookmarks, :comments, :replies]
            };
            render json: UserSerializer.new(user, options)
        else
            render json: { errors: 'User not found' }
        end
    end

    private
    def user_params
        params.require(:user).permit(:username, :password)
    end
end
