class RequestsController < ApplicationController

  def index
  end

  def fetch_data
    @response = RequestService.new.perform!
    render json: @response.to_json
  end
end
