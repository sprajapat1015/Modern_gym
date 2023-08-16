
require  'rails_helper'
RSpec.describe PaymentsController, type: :controller do
  
  before(:each) do 
    @user= FactoryBot.create(:user)
    @membership = FactoryBot.create(:membership, user_id: @user.id)
  end

#---------------------------------------------------------------------------------------

  describe "Get #index" do
    context 'successful responses' do
      it "index" do
        Payment.create(payment_date: Date.today, amount: 200, user_id: @user.id)
        get :index  ,params:{user_id: @user.id }
        expect(response).to be_successful 
      end
    end
  end

#---------------------------------------------------------------------------------------

  describe "POST #create" do
    context "with valid params" do
      it "creates a new Payment" do
        expect {
          post :create, params: { user_id: @user.to_param, payment: { amount: 200, payment_date: Date.today, user_id: @user.id, membership_id: @membership.id } }
        }.to change(Payment, :count).by(1)
      end
  
      it "redirects to the new_user_payment_path" do
        post :create, params: { user_id: @user.to_param, payment: { amount: 20, payment_date: Date.today, user_id: @user.id, membership_id: @membership.id } }
        expect(response.status).to be(302)
        response.should redirect_to root_path
      end
    end
  
    context "with invalid params" do
      it "assigns a newly created but unsaved Payment as @Payment" do
        post :create, params: { user_id: @user.to_param, payment: { payment_date: nil } }
        expect(assigns(:payment)).to be_a_new(Payment)
      end
  
      it "re-renders the :new template" do
        post :create, params: { user_id: @user.to_param, payment: { payment_date: nil } }
        # byebug
        expect(response).to render_template(:new)
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

#------------------------------------------------------------------------------------------

  describe "Get #new" do
    it '#new instance @payment ' do
      get :new, params: { user_id: @user.id }
      expect(assigns(:payment)).to be_instance_of(Payment)
      expect(response).to have_http_status(:success)
      expect(response).to render_template(:new)
    end
  end
  
#---------------------------------------------------------------------------------------


end

