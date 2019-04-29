class PolicySerializer
  include FastJsonapi::ObjectSerializer
  attributes :id, :policy_type, :division, :carrier_id, :client_id, :effective_date, :expiration_date, :written_premium, :carrier_policy_number
end
