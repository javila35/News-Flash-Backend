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
        # Get token from request
        token = request.authorization

        # Decode token
        response  = JWT.decode(token, Rails.application.secret_key_base, true, { :algorithm => 'HS256' })

        # Destructuring decoded token
        user_id = response[0]["user_id"]

        user = User.find(user_id)
        if user
          render json: {
            user: {
              id: user.id,
              username: user.username,
              first_name: user.first_name,
              bio: user.bio,
              location: user.location,
            },
            status: 200
        }
        else
          render json: {
            error: "Token could not be decoded.",
            status: 401
          }
        end
      end

      private
      def auth_params
        params.require(:auth).permit(:username, :password)
      end
end
