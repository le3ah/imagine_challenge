class Api::V1::Carriers::CountController < ApplicationController
  def show
    render json: Carrier.count
  end
end
