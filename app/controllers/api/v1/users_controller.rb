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
        @user = User.find_by(email: params['email'])
        @user = User.new(user_params)
        if @user.save
          @session = Session.new(user: @user.email, password: @user.password)
          if @session.save
            render json: { user: @user.email, password: @user.password }
          end
        else
          render json: { error: @user.errors }, status: 400
        end
      end

      def destroy
        @user = User.find(params[:id])
        if @user
          @user.destroy
          render json: { message: 'User successfully deleted.' }, status: 200
        else
          render json: { message: 'unable to deleted user.' }, status: 400
        end
      end

      private

      def user_params
        params.require(:user).permit(:first_name, :last_name, :email, :password)
      end
    end
  end
end
