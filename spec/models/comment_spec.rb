require 'rails_helper'

RSpec.describe Comment, type: :model do
  describe '#initialize' do

    let(:user) { User.create(email: 'michael@email.com', password: 'testtest') }
    let(:restaurant) { Restaurant.new(name: 'McDonald', address: 'New York City', user: user) }
    let(:comment) { Comment.new(content: 'okay food', user: user, restaurant: restaurant) }

    it 'is valid with all columns present' do
      expect(comment.valid?).to eq(true)
    end

    context 'with missing user' do
      before do
        comment.user = nil
      end

      it 'is not valid' do
        expect(comment.valid?).to eq(false)
      end

      it 'returns error message' do
        comment.valid?
        expect(comment.errors.messages).to eq({ user: ["must exist"]})
      end
    end

    context 'with missing restaurant' do
      before do
        comment.restaurant = nil
      end

      it 'is not valid' do
        expect(comment.valid?).to eq(false)
      end

      it 'returns error message' do
        comment.valid?
        expect(comment.errors.messages).to eq({ restaurant: ["must exist"]})
      end
    end

    context 'with missing content' do
      before do
        comment.content = nil
      end

      it 'is not valid' do
        expect(comment.valid?).to eq(false)
      end

      it 'returns error message' do
        comment.valid?
        expect(comment.errors.messages).to eq({ content: ["can't be blank"]})
      end
    end
  end
end
