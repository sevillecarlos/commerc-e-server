require 'jwt'


class Api::V1::SessionController < ApplicationController
    def create
        hmac_secret = '$C21$'        
        @user = User.find_by(email:params["email"])
        if @user
          if @user.password === params[:password]
            payload ={
              first_name: @user.first_name,
              last_name: @user.last_name,
              email: @user.email,
              
            }
            token = JWT.encode payload, hmac_secret, 'HS256'      
            render json: {token: token}, status: 200
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
