class ClientSerializer
  include FastJsonapi::ObjectSerializer
  attributes :id, :name, :address, :city, :state, :division, :major_group, :industry_group, :sic, :description
end
