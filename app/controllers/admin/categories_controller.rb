module Admin
    class CategoriesController < ApplicationController
      before_action :authenticate
  
      def index
        @categories = Category.all
      end
  
      def show
        @category = Category.find(params[:id])
        @products = @category.products.order(created_at: :desc)
      end
  
      private
  
      def authenticate
        authenticate_or_request_with_http_basic do |username, password|
          username == ENV['BASIC_AUTH_USERNAME'] && password == ENV['BASIC_AUTH_PASSWORD']
        end
      end
    end
  end
  