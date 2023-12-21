require 'rails_helper'

RSpec.describe LabStudy, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:code) }
    it { should validate_presence_of(:reference_range) }
    it { should validate_presence_of(:observation_value) }
    it { should validate_length_of(:name).is_at_least(3).is_at_most(99) }
  end

  describe 'associations' do
    it { should belong_to(:result) }
  end

  describe 'callbacks' do
    it { is_expected.to callback(:set_normal).before(:create) }
  end
end
