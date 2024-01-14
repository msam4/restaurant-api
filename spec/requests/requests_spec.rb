require 'rails_helper'
include Rails.application.routes.url_helpers

RSpec.describe API::V1::RestaurantsController, type: :request do
  describe '#create' do
    it 'should save an instance of restaurant to the db' do
      user = User.create(email: 'tom@email.com', password: 'testtest')
      params = { restaurant: { name: 'Wendys', address: 'Boston', user: user}}
      auth_token = user.authentication_token

      post "#{root_url}api/v1/restaurants", params: params, headers: { "X-User-Token": auth_token }
      # binding.break
      expect(Restaurant.last.name).to eq('Wendys')
    end
  end
end
