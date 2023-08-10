require 'rails_helper'

RSpec.describe EnrollmentsController, type: :controller do

  before(:each) do 
    @user= FactoryBot.create(:user)
  end
  # before(:each) do 
  #   @enrollment= FactoryBot.create(:enrollment)
  # end

#---------------------------------------------------------------------------------------

  describe "Get #index" do
    context 'successful responses' do
      it "index" do
        Enrollment.create(enrollment_date: Date.today, user_id: @user.id)
        get :index  ,params:{user_id: @user.id }
        expect(response).to be_successful 
      end
    end
  end

#--------------------------------------------------------------------------------------
  describe "POST #create" do
    context "with valid params" do
      it "creates a new Enrollment" do
        expect {
          post :create, params: { user_id: @user.to_param, enrollment: FactoryBot.attributes_for(:enrollment) }
        }.to change(Enrollment, :count).by(1)
      end
      
      it "redirects to the new_user_enrollment_path" do

        post :create, params: { user_id: @user.to_param, enrollment: FactoryBot.attributes_for(:enrollment, user: @user) }
        expect(response.status).to be(302)
      end
    end

    context "with invalid params" do
      it "assigns a newly created but unsaved Enrollment as @enrollment" do
        post :create, params: { user_id: @user.to_param, enrollment: { enrollment_date: nil } }
        expect(assigns(:enrollment)).to be_a_new(Enrollment)
      end

      it "re-renders the :new template" do
        post :create, params: { user_id: @user.to_param, enrollment: { enrollment_date: nil } }
        # byebug
        expect(response).to render_template(:new)
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

#-----------------------------------------------------------------------------------------
  
  describe "Get #new" do
    it '#new instance @enrollment ' do
      get :new, params: { user_id: @user.id }
      expect(assigns(:enrollment)).to be_instance_of(Enrollment)
      expect(response).to have_http_status(:success)
      expect(response).to render_template(:new)
    end
  end





end


