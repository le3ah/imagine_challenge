class Api::V1::Carriers::SearchController < ApplicationController
  def show
    if params[:company_name]
      render json: CarrierSerializer.new(Carrier.find_by("company_name ILIKE '#{params[:company_name]}'"))
    end
  end
end
