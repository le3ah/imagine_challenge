class Api::V1::PoliciesController < ApplicationController
  def index
    render json: PolicySerializer.new(Policy.all)
  end
end
