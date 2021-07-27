# frozen_string_literal: true

module Api
  module V1
    class ArticlesController < ApplicationController
      def show
        @receipt = Receipt.find(params[:id])
        render json: @receipt.articles, status: 200 if @receipt
      end

      def index
        @articles = Article.all
        render json: @articles, status: 200
      end

      def create
        @receipt = Receipt.find_by_id(article_params['receipt_id'])
        if @receipt
          @article = Article.create!(name: article_params['name'], total_price: article_params['total_price'],
                                     quantity: article_params['quantity'], receipt: @receipt)
          render json: @receipt.articles
        else
          render json: { error: 'Receipt dont exist' }, status: 400
        end
      end

      private

      def article_params
        params.require(:article).permit(:name, :total_price, :quantity, :receipt_id)
      end
    end
  end
end
