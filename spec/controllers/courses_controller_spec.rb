
require 'rails_helper'

RSpec.describe CoursesController, type: :controller do

  # let!(:trainer_coach1) {FactoryBot.create(:trainer_coach)}
  # let(:trainer_coach) { create(:trainer_coach) }
  @trainer_coach = TrainerCoach.create(first_name:"testsumit",last_name:"prajapat", phone_number:"12345678900")
  @courses = Course.create(class_name:"yoga", description: "india exercise hindustan jindabad", trainer_coach_id:@trainer_coach.id)
  describe "Get #index" do
    it "index" do
      byebug
      get :index, params {@trainer_coach.id}
      expect(response).to be_successful
    end
    # it "renders the :index view" do
    #   get :index
    #   expect(response).to render_template(:index)
    # end
  end







  # # let(:trainer_coach) { create(:trainer_coach) }
  # before(:each) do 
  #   @trainer_coach= FactoryBot.create(:trainer_coach)
  # end

  # describe "GET #index" do
  #   it "returns a successful response" do
  #     byebug
  #     @course =  @trainer_coach.courses.all
  #     get :index
  #     # expect(response).to be_successful
  #     # response.should redirect_to trainer_coach_courses_path
  #   end
  # end
end
