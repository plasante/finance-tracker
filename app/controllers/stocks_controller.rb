class StocksController < ApplicationController
    
    def search
        if params[:stock]
            # First we lookup the database
            @stock = Stock.find_by_ticker(params[:stock])
            # Otherwise we looket the net
            @stock ||= Stock.new_from_lookup(params[:stock])
        end

        if @stock
            #render json: @stock
            render partial: 'lookup'
        else
            render :status => 400
        end
    end
end