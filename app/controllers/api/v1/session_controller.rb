require 'jwt'


class Api::V1::SessionController < ApplicationController
    def create
        hmac_secret = '$C21$'
        payload = { data: 'test' }
        token = JWT.encode payload, hmac_secret, 'HS256'
        @user = User.find_by(email:params["email"])
        if @user
          if @user.password === params[:password]
            render json: {user: @user, token: token}, status: 200
          else
            render json: { error: 'Incorrect password' }, status: 400
          end
        else
            render json: { error: 'User don\'t exist' }, status: 400
        end
    end
    
    private
    def user_params
        params.require(:user).permit(:email, :password)
      end
end
