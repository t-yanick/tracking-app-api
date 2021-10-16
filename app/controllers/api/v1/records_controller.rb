module Api
  module V1
    class RecordsController < ApplicationController
      # before_action :authorized
      skip_before_action :verify_authenticity_token, raise: false
      before_action :set_record, only: %i[show update destroy]

      def index
        # @records = Record.all_records(@current_user)
        @records = Record.all
        # @record_dates = Record.all_record_dates(@current_user)
        @record_dates = Record.all

        if @records
          render json: { records: @records, record_dates: @record_dates }, status: 200

        else
          render json: 'No record yet'
        end
      end

      def show
        if @record
          render json: @record, status: 200
        else
          render json: { error: 'Record not found' }, status: 404
        end
      end

      def create
        @record = @current_user.records.create(result: record_params[:result], item_id: record_params[:itemId],
                                               date: record_params[:date])

        if @record.valid?
          render json: @record, status: 201
        else
          render json: { error: 'Track could not be created.' }, status: 404
        end
      end

      def update
        if @record.update(result: record_params[:result], item_id: record_params[:itemId], date: record_params[:date])
          render json: @record, status: 200
        else
          render json: { error: 'Track could not be opdated.' }, status: 422
        end
      end

      def destroy
        if @record
          @record.destroy
          render json: { message: 'Sucessfully deleted', deleted_record: @record }, status: 200
        else
          render json: { error: 'Sorry, Record could not be deleted' }, status: 422
        end
      end

      private

      def set_record
        @record = @current_user.records.find(params[:id])
      end

      def record_params
        params.require(:record).permit(:result, :item_id, :date, :itemId)
      end
    end
  end
end
