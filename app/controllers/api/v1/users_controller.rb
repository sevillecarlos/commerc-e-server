require 'bcrypt'

class Api::V1::UsersController < ApplicationController

  include BCrypt

  def index
    @users = User.all 
    render json: @users
  end

  def show
    @user = User.find(params[:id])
    render json: @user
  end

  def create
    @user = User.new(user_params)
    if @user.save
        render json: @user
    else
        render json: {error: @user.errors}, status: 400
    end
  end

  def destroy
    @user = User.find(params[:id])
    if @user
        @user.destroy
        render json: {message: 'User successfully deleted.'}, status:200
    else
        render json: {message: 'unable to deleted user.'}, status:400
    end 

  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password)
  end

end


# class AuthenticationController < ApplicationController
#     def authenticate
#         user = User.find_by_email(user_params[:email])
#         if user && user.authenticate(user_params[:password])
#             token = JWT.encode({ user_id: user.id }, "4dfjfoMYSECRETKEY1134") # <= Our application's secret key
#             render json: { auth_token: token, user: user } 
#         end
#     end

#     def user_params
#         params.permit(:email, :password)
#     end
# end