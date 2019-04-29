class Api::V1::CarriersController < ApplicationController
  def index
    render json: CarrierSerializer.new(Carrier.all)
  end
end
