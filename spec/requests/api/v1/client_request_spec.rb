require 'rails_helper'

describe 'Client API' do
  it "displays a list of clients" do
    create_list(:client, 3)
    get '/api/v1/clients'

    expect(response).to be_successful

    clients = JSON.parse(response.body)

    expect(clients.count).to eq(1)
    expect(clients["data"].count).to eq(3)
  end
end
