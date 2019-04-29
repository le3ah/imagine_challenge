FactoryBot.define do
  factory :client do
    name { "Lucille 2" }
    address { "1609 Rose St" }
    city { "Charleston" }
    state { "South Carolina" }
    division { "D" }
    major_group { "20" }
    industry_group { "205" }
    sic { "2052" }
    description { "Cookies and Crackers" }
  end
end
