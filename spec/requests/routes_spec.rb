require 'rails_helper'
include Rails.application.routes.url_helpers

RSpec.describe "Restaurant API Routes", type: :request do
  let(:user) { User.create(email: 'tom@email.com', password: 'testtest') }
  let(:user_email) { user.email }
  let(:auth_token) { user.authentication_token }

  describe "GET /api/v1/restaurants" do
    it "returns all restaurants" do
      get "/api/v1/restaurants"
      expect(response).to have_http_status(200)
    end
  end

  describe "POST /api/v1/restaurants" do
    it "creates a new restaurant" do
      # user = User.create(email: "tom@email.com", password: "testtest")
      params = { name: "Panda Express", address: "San Fransico", user: user}
      post "#{root_url}/api/v1/restaurants", params: { restaurant: params }, headers: { "X-User-Email": user_email, "X-User-Token": auth_token }

      expect(response).to have_http_status(201)
    end
  end

  describe "GET /api/v1/restaurants/:id" do
    it "return a specific restaurant" do
      restaurant = Restaurant.create(name: "Jack in the Box", address: "Boise", user: user)
      get "/api/v1/restaurants/#{restaurant.id}"

      expect(response).to have_http_status(200)
    end
  end

  describe "PUT /api/v1/restaurants/:id"  do
    it "updates a restaurant" do
      restaurant = Restaurant.create(name: "Carls Jr.", address: "Portland", user: user)
      new_attributes = { name: "Long Mein", address: "Portland" }
      put "#{root_url}/api/v1/restaurants/#{restaurant.id}", params: { restaurant: new_attributes }, headers: { "X-User-Email": user_email, "X-User-Token": auth_token }

      expect(response).to have_http_status(200)
    end
  end

  describe "DELETE /api/v1/restaurants/:id" do
    it "deletes a restaurant" do
      restaurant = Restaurant.create(name: "Hardys", address: "Lansing", user: user)

      expect {
        delete "#{root_url}/api/v1/restaurants/#{restaurant.id}", params: { id: restaurant.id }, headers: { "X-User-Email": user_email, "X-User-Token": auth_token}
      }.to change(Restaurant, :count).by(-1)
      expect(response).to have_http_status(204)
    end
  end
end
