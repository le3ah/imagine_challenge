class Api::V1::Policies::SearchController < ApplicationController
  def show
    if params[:carrier_policy_number]
      render json: PolicySerializer.new(Policy.find_by(carrier_policy_number: params[:carrier_policy_number]))
    end
  end
end
