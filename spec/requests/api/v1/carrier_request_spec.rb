require 'rails_helper'

describe 'Carrier API' do
  it "displays a list of carriers" do
    create_list(:carrier, 3)
    get '/api/v1/carriers'

    expect(response).to be_successful

    carriers = JSON.parse(response.body)

    expect(carriers.count).to eq(1)
    expect(carriers["data"].count).to eq(3)
  end
end
