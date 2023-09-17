require 'rails_helper'

RSpec.describe SellsController, type: :controller do
  describe "GET #index" do
    before do
      @user = User.last
      sign_in @user
      @bottle = Bottle.last
      get :index, params: { bottle_id: @bottle.id }
    end

    context 'When requesting the SellsController#index' do
      it "should return a success http response" do
        expect(response).to have_http_status(:success)
      end

      it "should render the 'index' template" do
        expect(response).to render_template(:index)
      end
    end
  end

end
