require 'rails_helper'

RSpec.describe Restaurant, type: :model do
  describe '#initialize' do

    let(:user) { User.create(email: 'michael@email.com', password: 'testtest') }
    let(:restaurant) { Restaurant.new(name: 'McDonald', address: 'New York City', user: user) }

    it 'is valid with all columns present' do
      expect(restaurant.valid?).to eq(true)
    end

    context 'with missing user' do
      before do
        restaurant.user = nil
      end

      it 'is not valid' do
        expect(restaurant.valid?).to eq(false)
      end
    end

    context 'with missing name' do
      before do
        restaurant.name = nil
      end

      it 'is not valid with missing name' do
        expect(restaurant.valid?).to eq(false)
      end

      it 'returns error message with missing name' do
        restaurant.valid?
        expect(restaurant.errors.messages).to eq({ name: ["can't be blank"]})
      end
    end

    context 'with missing address' do
      before do
        restaurant.address = nil
      end

      it 'is not valid with missing address' do
        expect(restaurant.valid?).to eq(false)
      end

      it 'returns error message with missing description' do
        restaurant.valid?
        expect(restaurant.errors.messages).to eq({ address: ["can't be blank"]})
      end
    end
  end
end
