
require 'rails_helper'

RSpec.describe Course, type: :model do
  describe 'associations' do
    # byebug
    it { should belong_to(:trainer_coach) } 
    it { is_expected.to have_many(:enrollments).dependent(:destroy) }
    it { is_expected.to have_many(:users).through(:enrollments).dependent(:destroy) }
  end

  describe 'validations' do
   it { should validate_presence_of(:class_name) }
   it { should validate_presence_of(:description) }
   it { should validate_presence_of(:start_time) }
   it { should validate_presence_of(:end_time) }
   it { should validate_presence_of(:capacity) }
  end

end


