class AuthController < ApplicationController
    def create
        user = User.find_by(username: auth_params[:username])
        if user && user.authenticate(auth_params["password"])
          token = issue_token(user)
          render json: {
            user: {
              id: user.id, 
              username: user.username, 
              first_name: user.first_name, 
              bio: user.bio, 
              location: user.location,
            },
              jwt: token,
              status: 202
          }
        else
          render json: {
            response: 'Log in failed.', 
            status: 401
          }
        end
      end

      def show
        user = User.find(user_id)
        if logged_in?
          render json: {
            id: user.id, 
            username: user.username, 
            first_name: user.first_name, 
            bio: user.bio, 
            location: user.location
        }
        else
          render json: {error: 'No user could be found', status: 401}
        end
      end

      private
      def auth_params
        params.require(:auth).permit(:username, :password)
      end
end
