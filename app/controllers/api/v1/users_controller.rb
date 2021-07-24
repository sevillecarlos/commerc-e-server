require 'bcrypt'
require 'jwt'

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
    hmac_secret = '$C21$'
    @user = User.find_by(email:params["email"])
    @user = User.new(user_params)
    if @user.save
      payload ={
        first_name: @user.first_name,
        last_name: @user.last_name,
        email: @user.email,
      }
      token = JWT.encode payload, hmac_secret, 'HS256'
      render json: {token:token}, status: 200
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
