require 'rails_helper'

RSpec.describe Client, type: :model do
  describe 'relationships' do
    it { should have_many :policies }
    it { should have_many(:carriers).through(:policies) }
  end
end
