class Policy < ApplicationRecord
  belongs_to :carrier, optional: true
  belongs_to :client, optional: true

  validates_uniqueness_of :carrier_policy_number
end
