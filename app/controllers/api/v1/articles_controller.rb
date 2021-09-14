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
    end
  end
end
