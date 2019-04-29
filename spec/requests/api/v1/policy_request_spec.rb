require 'rails_helper'

describe 'Policy API' do
  it "displays a list of policies" do
    carrier_1 = create(:carrier)
    carrier_2 = create(:carrier)
    client_1 = create(:client)
    client_2 = create(:client)
    policy_1 = create(:policy, carrier_id: carrier_1.id, client_id: client_1.id)
    policy_2 = create(:policy, carrier_id: carrier_2.id, client_id: client_1.id)
    policy_3 = create(:policy, carrier_id: carrier_1.id, client_id: client_2.id)
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
end
