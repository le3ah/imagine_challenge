class CarrierSerializer
  include FastJsonapi::ObjectSerializer
  attributes :id, :company_name, :company_address_1, :company_address_2, :company_city, :company_state, :company_zip
end
