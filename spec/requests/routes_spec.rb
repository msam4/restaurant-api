require 'rails_helper'

RSpec.describe "Restaurant API Routes", type: :request do
  describe "GET /api/v1/restaurants" do
    it "returns all restaurants" do
      get "/api/v1/restaurants"
      expect(response).to have_http_status(200)
    end
  end
end
