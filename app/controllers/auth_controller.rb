class AuthController < ApplicationController
  skip_before_action :authorized, only: [:create]

    def create
        user = User.find_by(username: auth_params[:username])
        if user && user.authenticate(auth_params["password"])
          token = issue_token(user)
          render json: {user: {id: user.id, username: user.username, first_name: user.first_name, location: user.location, twitter: user.twitter, website: user.website}, jwt: token}, status: :accepted
        else
          render json: {error: 'Log in failed.'}, status: 401
        end
      end
    
      def show
        user = User.find(user_id)
        if logged_in?
          render json: { id: user.id, username: user.username }
        else
          render json: {error: 'No user could be found'}, status: 401
        end
      end

      private
      def auth_params
        params.require(:auth).permit(:username, :password)
      end
end
