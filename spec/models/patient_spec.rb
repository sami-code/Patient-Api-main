require 'rails_helper'

RSpec.describe Patient, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:nationality) }
    it { should validate_presence_of(:birth_of_date) }
    it { should validate_presence_of(:ic_number) }
    it { should validate_presence_of(:gender) }
    it { should validate_presence_of(:phone_number) }
    it { should validate_length_of(:name).is_at_least(2).is_at_most(99) }
    it { should validate_length_of(:phone_number).is_at_least(8).is_at_most(14) }

    subject do
      Patient.new(name: 'John Doe', nationality: 'Indonesian', email: 'John@doe.com', phone_number: '+9123456789',
                  ic_number: '0123', gender: 'Male', birth_of_date: '1990-01-01')
    end
    it { should validate_uniqueness_of(:ic_number).case_insensitive }
  end

  describe 'associations' do
    it { should have_many(:results) }
  end

  describe 'enums' do
    it { should define_enum_for(:gender).with(%i[Male Female Other]) }
  end
end
