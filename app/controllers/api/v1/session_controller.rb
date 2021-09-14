# frozen_string_literal: true

require 'jwt'

module Api
  module V1
    class SessionController < ApplicationController
      def create
        @user = User.find_by(email: params[:user])
        if @user
          if @user.authenticate(params[:password])
            render json: { token: token }, status: 200
          else
            render json: { error: 'Incorrect password' }, status: 400
          end
        else
          render json: { error: 'User don\'t exist' }, status: 400
        end
      end

      private

      def token
        payload = {
          first_name: @user.first_name,
          last_name: @user.last_name,
          email: @user.email,
          id: @user.id
        }
        JWT.encode payload, '$C21$', 'HS256'
      end

      def user_params
        params.require(:user).permit(:user, :password)
      end
    end
  end
end
