module Api
  module V1
    class RecordsController < ApplicationController
      before_action :authorized
      before_action :set_record, only: [show, update, destroy]

      def index
        @records = Record.all_records(@current_user)
        @record_dates = Record.all_record_dates(@current_user)

        if @records
          render json: {records: @records, record_dates: @record_dates}, status: 200
        else
          render json: 'No record yet'
        end
      end

      def show
        if @record
          render json: @record, status: 200
        else
          render json: {error: 'Record not found'}, status: 404
        end
      end

      def create
        @
      end

      def update
      end

      def destroy
      end
    end
  end
end
