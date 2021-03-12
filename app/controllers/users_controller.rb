class UsersController < ApplicationController
    def create
        user = User.create(user_params)
        if user.valid? 
            token = issue_token(user)
            render json: {
                user: {
                    id: user.id, 
                    username: user.username, 
                    first_name: user.first_name, 
                    location: user.location
                },
                jwt: token,
                status: 201
            }
        else
            render json: { errors: user.errors.full_messages, status: 500 }
        end
    end

    def destroy
        user = User.find(params[:id])
        User.delete(user)
        render json: {status: 'success'}
    end

    def index
        users = User.all
        array = []
        users.map do |user|
            array << user.username
        end
        render json: array
    end

    def show
        user = User.find_by(username: params[:username])
        if user
            render json: UserSerializer.new(user)
        else
            render json: { errors: 'User not found.' }
        end
    end

    def update
        user = User.find(user_params[:id])
        user.update(user_params)
        user.save
        if user
            updatedUser = user.slice(:username, :id, :first_name, :bio, :location)
            render json: {
                user: updatedUser,
                status: 200
            }
        else 
            render json: {
                    errors: "User not updated.",
                    status: 406
                }
        end
    end

    private
    def user_params
        params.permit(:username, :password, :id, :first_name, :bio, :location)
    end
end