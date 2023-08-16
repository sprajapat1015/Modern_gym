require  'rails_helper'
RSpec.describe MembershipsController, type: :controller do
  # let(:user) { FactoryBot.create(:user) }
  
  before(:each) do 
    @user= FactoryBot.create(:user)
  end

#---------------------------------------------------------------------------------------

  describe "Get #index" do
    context 'successful responses' do
      it "index" do
        Membership.create(class_name:"yoga", start_date: Date.today, end_date: Date.today, status:"Active", user_id: @user.id)
        get :index  ,params:{user_id: @user.id }
        expect(response).to be_successful 
      end
    end
  end

#---------------------------------------------------------------------------------------

  describe "POST #create" do
    context "with valid params" do
      it "creates a new Membership" do
        expect {
          post :create, params: { user_id: @user.to_param, membership: FactoryBot.attributes_for(:membership) }
        }.to change(Membership, :count).by(1)
      end
  
      it "redirects to the new_user_payment_path" do
        post :create, params: { user_id: @user.to_param, membership: FactoryBot.attributes_for(:membership) }
        expect(response).to redirect_to(new_user_payment_path)
      end
    end
  
    context "with invalid params" do
      it "assigns a newly created but unsaved Membership as @membership" do
        post :create, params: { user_id: @user.to_param, membership: { class_name: nil } }
        expect(assigns(:membership)).to be_a_new(Membership)
      end
  
      it "re-renders the :new template" do
        post :create, params: { user_id: @user.to_param, membership: { class_name: nil } }
        expect(response).to render_template(:new)
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

#------------------------------------------------------------------------------------------

  describe "Get #new" do
    it '#new instance @enrollment ' do
      get :new, params: { user_id: @user.id }
      expect(assigns(:membership)).to be_instance_of(Membership)
      expect(response).to have_http_status(:success)
      expect(response).to render_template(:new)
    end
  end
  
#---------------------------------------------------------------------------------------


end
