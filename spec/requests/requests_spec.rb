require 'rails_helper'
include Rails.application.routes.url_helpers

RSpec.describe API::V1::RestaurantsController, type: :request do
  let(:user) { User.create(email: 'tom@email.com', password: 'testtest') }
  let(:params) { { restaurant: { name: 'Wendys', address: 'Boston', user: user } } }
  let(:user_email) { user.email }
  let(:auth_token) { user.authentication_token }

  describe '#create' do
    before { post "#{root_url}api/v1/restaurants", params: params, headers: { "X-User-Email": user_email, "X-User-Token": auth_token } }

    it 'should save an instance of restaurant to the db' do
      # user = User.create(email: 'tom@email.com', password: 'testtest')
      # params = { restaurant: { name: 'Wendys', address: 'Boston', user: user}}
      # user_email = user.email
      # auth_token = user.authentication_token

      # post "#{root_url}api/v1/restaurants", params: params, headers: { "X-User-Email": user_email, "X-User-Token": auth_token }
      expect(Restaurant.last.name).to eq('Wendys')
    end

    it 'renders the show' do
      expect(response).to have_http_status(201)
    end
  end

  describe '#update' do
    it 'should update the attributes of a restaurant' do
      restaurant = Restaurant.create(name: "White Castle", address: "St. Louis", user: user)
      new_name = "Sonic"
      new_address = "Chicago"

      patch "#{root_url}api/v1/restaurants/#{restaurant.id}", params: { restaurant: { name: new_name, address: new_address } }, headers: { "X-User-Email": user_email, "X-User-Token": auth_token }
      restaurant.reload

      expect(restaurant.name).to eq("Sonic")
      expect(restaurant.address).to eq("Chicago")
      expect(response).to have_http_status(:ok)
    end
  end

  describe "#index" do
    it "returns a success response" do
      get "#{root_url}api/v1/restaurants"
      expect(response).to be_successful
    end

    it "returns all restaurants" do
      restaurant1 = Restaurant.create(name: "Subway", address: "Houston", user: user)
      restaurant2 = Restaurant.create(name: "Outback", address: "Las Vegas", user: user)

      get "#{root_url}api/v1/restaurants"
      expect(Restaurant.first.name).to eq("Subway")
      expect(Restaurant.last.name).to eq("Outback")
    end
  end

  describe "#show" do
    let(:restaurant) { Restaurant.create(name: "Dairy Queen", address: "Seattle", user: user)}

    it "returns a success response" do
      get "#{root_url}api/v1/restaurants/#{restaurant.id}"
      expect(response).to be_successful
    end

    it "returns the correct restaurant" do
      get "#{root_url}api/v1/restaurants/#{restaurant.id}"
      expect(Restaurant.last.name).to eq("Dairy Queen")
    end
  end

  describe "#destroy" do
    let!(:restaurant) { Restaurant.create(name: "Starbucks", address: "Seattle", user: user)}

    # Don't know what to put inside the expect for the "destroys the restaurant" if I do the before
    # before { delete "#{root_url}api/v1/restaurants/#{restaurant.id}", params: { id: restaurant.id }, headers: { "X-User-Email": user_email, "X-User-Token": auth_token} }

    it "destroys the restaurant" do
      expect {
        delete "#{root_url}api/v1/restaurants/#{restaurant.id}", params: { id: restaurant.id }, headers: { "X-User-Email": user_email, "X-User-Token": auth_token }
      }.to change(Restaurant, :count).by(-1)
    end

    it "returns a no content response" do
      delete "#{root_url}api/v1/restaurants/#{restaurant.id}", params: { id: restaurant.id }, headers: { "X-User-Email": user_email, "X-User-Token": auth_token}
      expect(response).to have_http_status(:no_content)
    end
  end
end
