class Policy < ApplicationRecord
  belongs_to :carrier, optional: true
  belongs_to :client, optional: true
end
