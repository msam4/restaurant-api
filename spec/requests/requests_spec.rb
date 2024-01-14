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
      new_params = { restaurant: { name: new_name, address: new_address, user: user } }

      put "#{root_url}api/v1/restaurants/#{restaurant.id}", params: new_params, headers: { "X-User-Email": user_email, "X-User-Token": auth_token }
      # binding.break
      expect(restaurant.name).to eq("Sonic")
    end
  end
end
