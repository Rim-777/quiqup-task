class RequestsController < ApplicationController

  def index
    puts 'INDEX'
  end

  def fetch_data
    puts 'FETCH'
    @response = RequestService.new.perform!
    puts @response
    render json: @response.to_json
  end
end
