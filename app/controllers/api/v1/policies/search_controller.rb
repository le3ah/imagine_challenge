class Api::V1::Policies::SearchController < ApplicationController
  def show
    if params[:carrier_policy_number]
      render json: PolicySerializer.new(Policy.find_by(carrier_policy_number: params[:carrier_policy_number]))
    end
  end

  def index
    if params[:expiration_date]
      render json: PolicySerializer.new(Policy.where(expiration_date: params[:expiration_date]))
    elsif params[:effective_date]
      render json: PolicySerializer.new(Policy.where(effective_date: params[:effective_date]))
    end
  end
end
