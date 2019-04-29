FactoryBot.define do
  factory :policy do
    policy_type { "General Liability" }
    division { "Chicago" }
    carrier_id { "613" }
    client_id { "36" }
    effective_date { "2017-05-02" }
    expiration_date { "2018-05-02" }
    written_premium { 11850 }
    carrier_policy_number { "2052636" }
  end
end
