class AuthController < ApplicationController

    def create
        user_name = auth_params[:username].downcase
        user = User.find_by(username: user_name)
        if user && user.authenticate(auth_params["password"])
          token = issue_token(user)
          render json: {id: user.id, username: user.username, jwt: token}, status: :accepted
        else
          render json: {error: 'That user could not be found'}, status: 401
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
