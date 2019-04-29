class Api::V1::Clients::SearchController < ApplicationController
  def show
    if params[:name]
      render json: ClientSerializer.new(Client.find_by("name ILIKE '#{params[:name]}'"))
    end
  end
end
