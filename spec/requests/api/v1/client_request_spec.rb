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
  it "returns one client by its id" do
    client_1 = create(:client)

    get "/api/v1/clients/#{client_1.id}"

    client = JSON.parse(response.body)
    expect(response).to be_successful
    expect(client["data"]["id"]).to eq(client_1.id.to_s)
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
  context "client relationships" do
    it "returns all policies for a single client" do
      client_1 = create(:client)
      client_2 = create(:client)
      carrier_1 = create(:carrier)

      policy_1 = create(:policy, carrier_id: carrier_1.id, client_id: client_1.id, carrier_policy_number: "12345678")
      policy_2 = create(:policy, carrier_id: carrier_1.id, client_id: client_1.id, carrier_policy_number: "987654321")
      policy_3 = create(:policy, carrier_id: carrier_1.id, client_id: client_2.id, carrier_policy_number: "784536123")

      get "/api/v1/clients/#{client_1.id}/policies"

      expect(response).to be_successful
      policies = JSON.parse(response.body)

      expect(policies["data"].count).to eq(2)
      expect(policies["data"][0]["attributes"]["client_id"]).to eq(client_1.id)
      expect(policies["data"][0]["attributes"]["client_id"]).to_not eq(client_2.id)
      expect(policies["data"][1]["attributes"]["client_id"]).to eq(client_1.id)
      expect(policies["data"][1]["attributes"]["client_id"]).to_not eq(client_2.id)
    end
  end
end
