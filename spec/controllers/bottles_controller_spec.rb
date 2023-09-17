require 'rails_helper'

RSpec.describe BottlesController, type: :controller do
  describe "GET #index without filter params" do
    before(:each) do
      @user = User.last
      sign_in @user
      get :index
    end

    context 'When requesting the BottlesController#index' do
      it "should return a success http response" do
        expect(response).to have_http_status(:success)
      end

      it "should render the 'index' template" do
        expect(response).to render_template(:index)
      end
    end
  end

  describe "GET #index with filter params" do
    render_views
    before(:each) do
      @user = User.last
      sign_in @user
      get :index, params: { min_price: 1000, max_price: 1500 }
    end
    context 'When requesting the BottlesController#index' do
      it "should return a success http response" do
        expect(response).to have_http_status(:success)
      end
    end

    it "should render the 'index' template" do
      expect(response).to render_template(:index)
    end

    it "should only take bootles within the price range" do
      @bottle_in = Bottle.first
      @bottle_out = Bottle.last
      Sell.create(price: 1200, bottle_id: @bottle_in.id, website_id: Website.last.id)
      Sell.create(price: 900, bottle_id: @bottle_out.id, website_id: Website.last.id)
      expect(response.body).to include @bottle_in.name
      expect(response.body).not_to include @bottle_out.name
    end
  end

  describe "GET #show" do
    render_views
    before(:each) do
      @user = User.last
      sign_in @user
      @bottle = Bottle.last
      get :show, params: {id: @bottle.id}
    end
    context 'When requesting the BottlesController#show' do
      it "should return a success http response" do
        expect(response).to have_http_status(:success)
      end

      it "should render the 'show' template" do
        expect(response).to render_template(:show)
      end

      it "should include the name of the bottle" do
        expect(response.body).to include @bottle.name
      end

    end
  end
end
