class Api::V1::Policies::CountController < ApplicationController
  def show
    render json: Policy.count
  end
end
