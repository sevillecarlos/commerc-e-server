# frozen_string_literal: true

require 'bcrypt'

module Api
  module V1
    class UsersController < ApplicationController
      include BCrypt

      def index
        @users = User.all
        render json: @users
      end

      def show
        @user = User.find_by_email(params[:id])
        render json: @user
      end

      def create
        @user = User.new(first_name: user_params[:first_name], last_name: user_params[:last_name],
                         email: user_params[:email], password: user_params[:password_digest])
        if @user.save
          @credit = Credit.create!(amount: 100, user: @user)
          render json: { user: @user.email, password: @user.password }
        else
          render json: { error: @user.errors }, status: 400
        end
      end

      private

      def user_params
        params.require(:user).permit(:first_name, :last_name, :email, :password_digest)
      end
    end
  end
end
