
require 'rails_helper'

RSpec.describe CoursesController, type: :controller do

  before(:each) do 
    @trainer_coach= FactoryBot.create(:trainer_coach)
  end
 
  

  
  describe "Get #index" do
    context 'successful responses' do
      it "index" do
        @courses = Course.create(class_name:"yoga", description: "This is yoga class", trainer_coach_id: @trainer_coach.id)
        get :index  ,params:{trainer_coach_id: @trainer_coach.id }
        expect(response).to be_successful 
      end

      it "renders the :index view" do
        @courses = Course.create(class_name:"yoga", description: "This is yoga class", trainer_coach_id: @trainer_coach.id)
        get :index  ,params:{trainer_coach_id: @trainer_coach.id}
        expect(response).to render_template(:index)
      end
    end
  end

#------------------------------------------------------------------------------------------

  describe "permitted status" do
    context "success" do
      it "create" do
        post :create, params: { trainer_coach_id: @trainer_coach.id, course: {class_name:"yoga", description: "This is yoga class",start_time: DateTime.now,end_time: DateTime.now,capacity: 20 } }
        expect(response.status).to be(302)
      end

      it 'renders the new template with unprocessable_entity status' do
        post :create, params: {trainer_coach_id: @trainer_coach.id, course: { class_name: "" } } 
        expect(response).to render_template(:new)
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

#------------------------------------------------------------------------------------------
  
  describe "Get #new" do
    it '#new instance @course ' do
      get :new, params: { trainer_coach_id: @trainer_coach.id }
      expect(assigns(:course)).to be_instance_of(Course)
      expect(response).to have_http_status(:success)
      expect(response).to render_template(:new)
    end
  end

#------------------------------------------------------------------------------------------


end

