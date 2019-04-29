class Api::V1::Clients::PoliciesController < ApplicationController
  def index
    policies = Client.find(params[:id]).policies
    render json: PolicySerializer.new(policies)
  end
end
