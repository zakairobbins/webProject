require 'rails_helper'

RSpec.describe RequestController, type: :controller do

  describe "GET #get" do
    it "returns http success" do
      get :get
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #post" do
    it "returns http success" do
      get :post
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #destroy" do
    it "returns http success" do
      get :destroy
      expect(response).to have_http_status(:success)
    end
  end

end
