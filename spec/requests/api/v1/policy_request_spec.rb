require 'rails_helper'

describe 'Policy API' do
  it "displays a list of policies" do
    carrier_1 = create(:carrier)
    carrier_2 = create(:carrier)
    client_1 = create(:client)
    client_2 = create(:client)
    policy_1 = create(:policy, carrier_id: carrier_1.id, client_id: client_1.id, carrier_policy_number: "12345678")
    policy_2 = create(:policy, carrier_id: carrier_2.id, client_id: client_1.id, carrier_policy_number: "987654321")
    policy_3 = create(:policy, carrier_id: carrier_1.id, client_id: client_2.id, carrier_policy_number: "784536123")
    get '/api/v1/policies'

    expect(response).to be_successful

    policies = JSON.parse(response.body)

    expect(policies.count).to eq(1)
    expect(policies["data"].count).to eq(3)
    expect(policies["data"][0]["attributes"]["id"]).to eq(policy_1.id)
    expect(policies["data"][0]["attributes"]["carrier_id"]).to eq(carrier_1.id)
    expect(policies["data"][0]["attributes"]["client_id"]).to eq(client_1.id)

    expect(policies["data"][1]["attributes"]["id"]).to eq(policy_2.id)
    expect(policies["data"][1]["attributes"]["carrier_id"]).to eq(carrier_2.id)
    expect(policies["data"][1]["attributes"]["client_id"]).to eq(client_1.id)

    expect(policies["data"][2]["attributes"]["id"]).to eq(policy_3.id)
    expect(policies["data"][2]["attributes"]["carrier_id"]).to eq(carrier_1.id)
    expect(policies["data"][2]["attributes"]["client_id"]).to eq(client_2.id)
  end
  context 'parameter find search' do
    it "can find a single policy by policy_number" do
      carrier = create(:carrier)
      carrier_2 = create(:carrier, company_name: "Not Bluths")
      client = create(:client)
      policy_1 = create(:policy, carrier_id: carrier.id, client_id: client.id, carrier_policy_number: "12345678")
      policy_2 = create(:policy, carrier_id: carrier_2.id, client_id: client.id, carrier_policy_number: "987654321")

      get "/api/v1/policies/find?carrier_policy_number=#{policy_1.carrier_policy_number}"

      policy = JSON.parse(response.body)
      expect(response).to be_successful
      expect(policy["data"]["attributes"]["carrier_policy_number"]).to eq(policy_1.carrier_policy_number)
      expect(policy["data"]["attributes"]["carrier_id"]).to eq(policy_1.carrier_id)
      expect(policy["data"]["attributes"]["carrier_id"]).to_not eq(policy_2.carrier_id)
    end
  end
  context 'parameter find all search' do
    it "can find all policies by expiration_date" do
      carrier = create(:carrier)
      carrier_2 = create(:carrier, company_name: "Not Bluths")
      client = create(:client)
      policy_1 = create(:policy, carrier_id: carrier.id, client_id: client.id, expiration_date: "2018-03-02", carrier_policy_number: "12345678")
      policy_2 = create(:policy, carrier_id: carrier_2.id, client_id: client.id, expiration_date: "2018-03-02", carrier_policy_number: "987654321")

      get "/api/v1/policies/find_all?expiration_date=#{policy_1.expiration_date}"

      policies = JSON.parse(response.body)
      expect(response).to be_successful
      expect(policies["data"][0]["attributes"]["expiration_date"]).to eq(policy_1.expiration_date)
      expect(policies["data"][1]["attributes"]["expiration_date"]).to eq(policy_2.expiration_date)
    end
    it "can find all policies by effective_date" do
      carrier = create(:carrier)
      carrier_2 = create(:carrier, company_name: "Not Bluths")
      client = create(:client)
      policy_1 = create(:policy, carrier_id: carrier.id, client_id: client.id, effective_date: "2018-03-02", carrier_policy_number: "12345678")
      policy_2 = create(:policy, carrier_id: carrier_2.id, client_id: client.id, effective_date: "2018-03-02", carrier_policy_number: "987654321")

      get "/api/v1/policies/find_all?effective_date=#{policy_1.effective_date}"

      policies = JSON.parse(response.body)
      expect(response).to be_successful
      expect(policies["data"][0]["attributes"]["effective_date"]).to eq(policy_1.effective_date)
      expect(policies["data"][1]["attributes"]["effective_date"]).to eq(policy_2.effective_date)
    end
  end
end
