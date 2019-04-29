class Api::V1::ClientsController < ApplicationController
  def index
    render json: ClientSerializer.new(Client.page(page).per(per_page))
  end

  def show
    render json: ClientSerializer.new(Client.find(params[:id]))
  end

  private

  def page
    @page ||= params[:page] || 1
  end

  def per_page
    @per_page ||= params[:per_page] || 50
  end
end
