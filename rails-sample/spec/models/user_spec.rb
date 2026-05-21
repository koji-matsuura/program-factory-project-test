require 'rails_helper'

describe User, type: :model do
  describe 'validations' do
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_presence_of(:email) }
    it { is_expected.to validate_uniqueness_of(:email) }
  end
  
  describe 'associations' do
    it { is_expected.to have_many(:issues).dependent(:destroy) }
  end
  
  describe '#full_name' do
    let(:user) { build(:user, name: 'John Doe') }
    it 'returns the user name' do
      expect(user.full_name).to eq('John Doe')
    end
  end
end
