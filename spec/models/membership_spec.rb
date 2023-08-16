
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

  context 'when start_date is less than today' do
    it 'adds an error to start_date' do
      byebug
      @membership.start_date = Date.yesterday
      membership.check_start_end_date_for_status
      expect(membership.errors[:start_date]).to include("aren't less than from today.")
    end
  end
  
  context 'when start_date is greater than or equal to today' do
    # it 'does not add an error to start_date' do
    #   your_model.start_date = Date.today
    #   your_model.check_start_end_date_for_status
    #   expect(your_model.errors[:start_date]).to be_empty
    # end
  end

end

