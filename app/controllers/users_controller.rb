class UsersController < ApplicationController
    def create
        user = User.create(user_params)
        if user.valid? 
            token = issue_token(user)
            render json: {user: {id: user.id, username: user.username, first_name: user.first_name, location: user.location}, jwt: token}
        else
            render json: { errors: user.errors.full_messages }
        end
    end

    def destroy
        user = User.find(params[:id])
        User.delete(user)
        render json: {status: 'success'}
    end

    def index
        users = User.all
        render json: users
    end

    def show
        user = User.find_by(username: params["id"]);
        if user 
            options = {
                include: [:bookmarks, :comments]
            }
            render json: UserSerializer.new(user, options)
        else
            render json: { errors: 'User not found.' }
        end
    end

    def update
        user = User.find(user_params[:id])
        user.update(user_params)
        render json: user
    end

    private
    def user_params
        params.require(:user).permit(:username, :password, :id, :first_name, :bio, :location)
    end
end
