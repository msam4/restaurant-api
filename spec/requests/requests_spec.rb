require 'rails_helper'
include Rails.application.routes.url_helpers

RSpec.describe API::V1::RestaurantsController, type: :request do
  describe '#create' do
    let(:user) { User.create(email: 'tom@email.com', password: 'testtest') }
    let(:params) { { restaurant: { name: 'Wendys', address: 'Boston', user: user } } }
    let(:user_email) { user.email }
    let(:auth_token) { user.authentication_token }
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
end
