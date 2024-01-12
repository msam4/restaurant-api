require 'rails_helper'

RSpec.describe Restaurant, type: :model do
  describe '#initialize' do
    it 'is valid with all columns present' do
      restaurant = Restaurant.new(name: 'McDonald', address: 'New York City')
      expect(restaurant.valid?).to eq(true)
    end
  end
end
