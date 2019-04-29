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
  context 'paramter find search' do
    it "can find a single client by name" do
      client_1 = create(:client)
      client_2 = create(:client, name: "Lucille 3")

      get "/api/v1/clients/find?name=#{client_1.name}"

      client = JSON.parse(response.body)
      expect(response).to be_successful
      expect(client["data"]["attributes"]["name"]).to eq(client_1.name)
      expect(client["data"]["attributes"]["name"]).to_not eq(client_2.name)
    end
  end
  it "returns a total count of all clients" do
    create_list(:client, 5)
    get "/api/v1/clients/total_count"

    client_count = JSON.parse(response.body)
    expect(response).to be_successful
    expect(client_count).to eq(5)
  end
end
