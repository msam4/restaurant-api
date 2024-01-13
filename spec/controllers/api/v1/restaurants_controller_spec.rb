require 'rails_helper'

RSpec.describe Api::V1::RestaurantsController, type: :controller do
  describe '#create' do
    it 'should save an instance of restaurant to the db' do
      user = User.create(email: 'sam@email.com', password: 'testtest')
      params = { restaurant: { name: 'Wendys', address: 'Boston', user: user}}

      post :create, params: params
      expect(Restaurant.last.address).to eq('Boston')
    end
  end
end
