require 'rails_helper'

RSpec.describe "Restaurant API Routes", type: :request do
  let(:user) { User.create(email: 'tom@email.com', password: 'testtest') }

  describe "GET /api/v1/restaurants" do
    it "returns all restaurants" do
      get "/api/v1/restaurants"
      expect(response).to have_http_status(200)
    end
  end

  # POST test is not working. Same issue in the controller rspec test (now in request spec test)
  describe "POST /api/v1/restaurants" do
    it "creates a new restaurant" do
      # user = User.create(email: "tom@email.com", password: "testtest")
      params = { name: "Panda Express", address: "San Fransico", user: user}
      post "/api/v1/restaurants", params: { restaurant: params }

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

  # PUT test is not working. Same issue as the POST test
  describe "PUT /api/v1/restaurants/:id"  do
    it "updates a restaurant" do
      restaurant = Restaurant.create(name: "Carls Jr.", address: "Portland", user: user)
      new_attributes = { name: "Long Mein", address: "Portland" }
      put "/api/v1/restaurants/#{restaurant.id}", params: { restaurant: new_attributes }

      expect(response).to have_http_status(200)
    end
  end

  # DELETE test is not working. Same issue as the POST test
  describe "DELETE /api/v1/restaurants/:id" do
    it "deletes a restaurant" do
      restaurant = Restaurant.create(name: "Hardys", address: "Lansing", user: user)

      expect {
        delete "/api/v1/restaurants/#{restaurant.id}"
      }.to change(Restaurant, :count).by(-1)
      expect(response).to have_http_status(204)
    end
  end
end
