class Api::V1::Clients::CountController < ApplicationController
  def show
    render json: Client.count
  end
end
