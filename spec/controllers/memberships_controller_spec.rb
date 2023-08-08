require  'rails_helper'

RSpec.describe MembershipsController, type: :controller do


  describe "GET #index" do
    context "test" do
      # byebug
      it "displays all Memberships" do
        get :index
      end
    end
  end

end

