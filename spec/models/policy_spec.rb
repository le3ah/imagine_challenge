require 'rails_helper'

RSpec.describe Policy, type: :model do
  describe 'relationships' do
    it { should belong_to :carrier }
    it { should belong_to :client }
  end
  describe 'uniqueness validation' do
    it { should validate_uniqueness_of(:carrier_policy_number) }
  end 
end
