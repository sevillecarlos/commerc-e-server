# frozen_string_literal: true

module Api
  module V1
    class ReceiptsController < ApplicationController
      def show
        @user = User.find(params[:id])
        render json: @user.receipts
      end

      def index
        @receipt = Receipt.all
        render json: @receipt
      end

      def create
        @user = User.find_by_id(credit_params['user_id'])
        if @user
          @credit = Receipt.create!(code: credit_params['code'], total: credit_params['total'], user: @user)
          render json: @user.receipts
        else
          render json: { error: 'User dont exist' }
        end
      end

      private

      def credit_params
        params.require(:receipt).permit(:code, :total, :user_id)
      end
    end
  end
end
