class Api::V1::ClientsController < ApplicationController
  def index
    render json: ClientSerializer.new(Client.all)
  end
end
