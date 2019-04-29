class Carrier < ApplicationRecord
  has_many :policies
  has_many :clients, through: :policies
end
