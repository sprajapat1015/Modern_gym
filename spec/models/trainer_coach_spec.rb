require 'rails_helper'

RSpec.describe TrainerCoach, type: :model do
  describe "Association" do
    it { is_expected.to have_many(:courses).dependent(:destroy)}
  end
  describe "validation" do
    it { should validate_presence_of(:first_name)}
    it { should validate_presence_of(:last_name)}
    it { should validate_presence_of(:phone_number)}
    it { should validate_presence_of(:expertise)}
  end
end









