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
  context 'parameter find search' do
    it "can find a single carrier by company_name" do
      carrier_1 = create(:carrier)
      carrier_2 = create(:carrier, company_name: "Not Bluths")

      get "/api/v1/carriers/find?company_name=#{carrier_1.company_name}"

      carrier = JSON.parse(response.body)
      expect(response).to be_successful
      expect(carrier["data"]["attributes"]["company_name"]).to eq(carrier_1.company_name)
      expect(carrier["data"]["attributes"]["company_name"]).to_not eq(carrier_2.company_name)
    end
  end
  it "returns a total count of all carriers" do
    create_list(:carrier, 5)
    get "/api/v1/carriers/total_count"

    carrier_count = JSON.parse(response.body)
    expect(response).to be_successful
    expect(carrier_count).to eq(5)
  end
end
