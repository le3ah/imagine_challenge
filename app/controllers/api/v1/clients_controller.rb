class Api::V1::ClientsController < ApplicationController
  def index
    render json: ClientSerializer.new(Client.all)
  end

  def show
    render json: ClientSerializer.new(Client.find(params[:id]))
  end
end
