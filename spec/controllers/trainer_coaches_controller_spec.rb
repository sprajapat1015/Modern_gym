require 'rails_helper'

RSpec.describe TrainerCoachesController, type: :controller do

  let(:trainer_coach) { create(:trainer_coach) }

  before(:each) do 
    @trainer_coach= FactoryBot.create(:trainer_coach)
  end

  describe "Get #index" do
    it "index" do
      get :index
      expect(response).to be_successful
    end

    it "renders the :index view" do
      get :index
      expect(response).to render_template(:index)
    end
  end

  describe "Get #show" do
    it 'respose to be succusseful #show ' do
      get :show,  params: {id: @trainer_coach.to_param}
      expect(response).to be_successful
    end

    it "renders the :show view" do
      get :show, params: {id: @trainer_coach.to_param}
      expect(response).to render_template(:show)
    end   
  end

  describe "Get #edit" do
    it 'respose to be succusseful #edit ' do
      get :edit,  params: {id: @trainer_coach.to_param}
      expect(response).to be_successful
    end

    it "renders the :edit view" do
      get :edit, params: {id: @trainer_coach.to_param}
      expect(response).to render_template(:edit)
    end
  end

  describe "Get #new" do
      it '#new instance @author ' do
        get :new
        expect(assigns(:trainer_coach)).to be_instance_of(TrainerCoach)
      end
      it "renders the :new view" do
        get :new
        expect(response).to render_template(:new)
      end
  end





  describe "permitted status" do
    it "create" do
      post :create, params:{trainer_coach:{first_name: "Sumit",last_name:"prajapat",phone_number:"1234567890", expertise:"Yoga"}}
      response.should redirect_to trainer_coaches_path
    end
  end

end


