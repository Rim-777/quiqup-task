class RequestsController < ApplicationController

  def index
  end

  def fetch_data
    @response = RequestService.new.perform!

    puts @response.to_json
  end
end
