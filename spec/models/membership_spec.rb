
require 'rails_helper'

RSpec.describe Membership, type: :model do
  describe 'associations' do
    # byebug
    it { should belong_to(:user) } 
    it { is_expected.to have_many(:payments).dependent(:destroy) }
    it { is_expected.to have_many(:users).through(:payments).dependent(:destroy) }
  end

  describe 'validations' do
   it { should validate_presence_of(:start_date) }
   it { should validate_presence_of(:end_date) }
   it { should validate_presence_of(:status) }
  end

end
