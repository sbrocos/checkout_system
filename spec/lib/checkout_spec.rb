# frozen_string_literal: true

require './spec/spec_helper'
require './lib/checkout'
require './lib/basket'
require './lib/item'

describe Checkout do
  subject(:checkout) { described_class.new }

  let(:tea) { Item.new 'GR1', 'Green tea', 3.11 }
  let(:strawberries) { Item.new 'SR1', 'Strawberries', 5.00 }
  let(:coffee) { Item.new 'CF1', 'Coffee', 11.23 }

  describe '#scan' do
    it 'increment an element in basket' do
      checkout.scan tea
      expect(checkout.basket.items).to eq [tea]
    end
  end

  describe '#total' do
    context 'without pricing_rules' do
      before do
        checkout.scan tea
        checkout.scan strawberries
        checkout.scan coffee
      end

      it { expect(checkout.total).to eq 19.34 }
    end
  end
end
