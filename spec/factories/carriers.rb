FactoryBot.define do
  factory :carrier do
    company_name { "Bluth Company" }
    company_address_1 { "123 California St" }
    company_address_2 { "Apt 2" }
    company_city { "Cullman" }
    company_state { "AL" }
    company_zip { "35055" }
  end
end
