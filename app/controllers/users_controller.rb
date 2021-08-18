module Api 
  module V1 
    class UsersController < ApplicationController
      before_action :authorized, only: [:show]

      def show 
        render json: @current_user, status: 200
      end

      def create 
        @user = User.create(username: user_params[:username], password: user_params[:password])

        
      end

      private
    end
  end
end
