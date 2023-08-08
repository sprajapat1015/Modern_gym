
require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'associations' do
 
    it { is_expected.to have_one(:address).dependent(:destroy) }

    it { is_expected.to have_many(:memberships).dependent(:destroy) }
    it { is_expected.to have_many(:payments).through(:memberships).dependent(:destroy) }

    it { is_expected.to have_many(:enrollments).dependent(:destroy) }
    it { is_expected.to have_many(:courses).through(:enrollments).dependent(:destroy) }
  end

  describe 'validations' do
   it { should validate_presence_of(:first_name) }
   it { should validate_presence_of(:last_name) }
   it { should validate_presence_of(:date_of_birth) }
   it { should validate_presence_of(:email) }
   it { should validate_presence_of(:phone_number) }
   it { should validate_presence_of(:gender) }
  end

end
