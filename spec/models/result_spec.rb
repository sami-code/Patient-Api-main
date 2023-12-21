require 'rails_helper'

RSpec.describe Result, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:lab_id) }
    it { should validate_presence_of(:lab_code) }
    it { should validate_presence_of(:tested_at) }
  end

  describe 'associations' do
    it { should belong_to(:patient) }
    it { should have_many(:lab_studies) }
  end
end
