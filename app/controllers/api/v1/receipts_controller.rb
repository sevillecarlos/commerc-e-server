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
        @articles = params[:articles]

        @user = User.find_by_id(receipt_params['user_id'])
        if @user
          @receipt = Receipt.create!(code: receipt_params['code'], total: receipt_params['total'], user: @user)
          @articles.select do |article|
            Article.create(name: article['name'], quantity: article['quantity'], total_price: article['price'],
                           receipt_id: @receipt[:id])
          end
          render json: @user.receipts
        else
          render json: { error: 'User dont exist' }
        end
      end

      private

      def receipt_params
        params.require(:receipt).permit(:code, :total, :user_id, articles: [])
      end
    end
  end
end
