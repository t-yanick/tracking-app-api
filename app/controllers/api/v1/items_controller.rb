module Api
  module V1
    class ItemsController < ApplicationController
      before_action :authorized, except: [index, show]
      before_action :set_item, only: [show, update, destroy]

      def index
      end

      def show
      end

      def create
      end

      def update
      end

      def destroy
      end

      private

      def item_params
      end

      def set_item
      end
    end
  end
end
