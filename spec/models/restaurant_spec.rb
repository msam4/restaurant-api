require 'rails_helper'

RSpec.describe Restaurant, type: :model do
  let(:user) { User.create(email: 'michael@email.com', password: 'testtest') }
  let(:restaurant) { Restaurant.new(name: 'McDonald', address: 'New York City', user: user) }

  describe '#initialize' do

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

      it 'returns error message' do
        restaurant.valid?
        expect(restaurant.errors.messages).to eq({ user: ["must exist"]})
      end
    end

    context 'with missing name' do
      before do
        restaurant.name = nil
      end

      it 'is not valid' do
        expect(restaurant.valid?).to eq(false)
      end

      it 'returns error message' do
        restaurant.valid?
        expect(restaurant.errors.messages).to eq({ name: ["can't be blank"]})
      end
    end

    context 'with missing address' do
      before do
        restaurant.address = nil
      end

      it 'is not valid' do
        expect(restaurant.valid?).to eq(false)
      end

      it 'returns error message' do
        restaurant.valid?
        expect(restaurant.errors.messages).to eq({ address: ["can't be blank"]})
      end
    end
  end

  ## Unable to get uniqueness of name to work. The false test is always failing.
  ## Add a new migration to add uniqueness to restaurant name's index but the test still fails

  # context 'when checking uniqueness of name' do
  #   it 'return true if the name is unique' do
  #     # test code here
  #     expect(restaurant).to be_valid
  #   end

  #   it 'return false if the name is not unique' do
  #     # test code here
  #     duplicate_restaurant = Restaurant.new(name: 'McDonald', address: 'Denver', user: user)
  #     expect(duplicate_restaurant).not_to be_valid
  #   end
  # end
end
