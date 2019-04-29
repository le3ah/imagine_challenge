require 'rails_helper'

RSpec.describe Carrier, type: :model do
  describe 'relationships' do
    it { should have_many :policies }
    it { should have_many(:clients).through(:policies) }
  end
end
