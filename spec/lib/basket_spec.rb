# frozen_string_literal: true

require './spec/spec_helper'
require './lib/basket'
require './lib/item'

RSpec.describe Basket do
  subject(:basket) { described_class.new }

  let(:tea) { Item.new 'GR1', 'Green tea', 3.11 }
  let(:strawberries) { Item.new 'SR1', 'Strawberries', 5.00 }
  let(:coffee) { Item.new 'CF1', 'Coffee', 11.23 }

  describe '#items' do
    context 'without items' do
      it 'return an empty array' do
        expect(basket.items).to eq []
      end
    end

    context 'with one item' do
      before { basket.items.push tea }

      it 'return an empty array' do
        expect(basket.items).to eq [tea]
      end
    end
  end

  describe '#add_item' do
    it 'increment one ellemt of items' do
      basket.add_item tea
      expect(basket.items).to eq [tea]
    end
  end

  describe '#items_by_code' do
    before do
      basket.add_item tea
      basket.add_item coffee
    end

    it 'return an array with results' do
      expect(basket.items_by_code('GR1')).to eq [tea]
    end
  end
end
