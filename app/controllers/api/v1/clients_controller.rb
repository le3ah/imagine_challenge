class Api::V1::ClientsController < ApplicationController
  def index
    @clients = Client.page(page).per(per_page)
    render json: ClientSerializer.new(@clients)
    set_pagination_header
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

  def set_pagination_header
    headers["X-Total-Count"] = @clients.total_count
  end
end
