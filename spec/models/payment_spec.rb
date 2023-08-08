
require 'rails_helper'

RSpec.describe Payment, type: :model do
  describe 'associations' do
    it { should belong_to(:user) } 
    it { should belong_to(:membership) } 

  end

  describe 'validations' do
   it { should validate_presence_of(:amount) }
   it { should validate_presence_of(:payment_date) }

  end

end

