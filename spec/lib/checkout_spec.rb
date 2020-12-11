# frozen_string_literal: true

require './spec/spec_helper'

RSpec.describe Checkout do
  shared_context 'with correct data' do
    subject(:checkout) { described_class.new(pricing_rules) }

    let(:pricing_rules) do
      [
        { name: 'ceo', code: 'GR1' },
        { name: 'coo', code: 'SR1' },
        { name: 'cto', code: 'CF1' }
      ]
    end
    let(:tea) { Item.new 'GR1', 'Green tea', 3.11 }
    let(:strawberries) { Item.new 'SR1', 'Strawberries', 5.00 }
    let(:coffee) { Item.new 'CF1', 'Coffee', 11.23 }
  end

  context 'with wrong rule by name' do
    subject(:checkout) { described_class.new([{ name: 'cpo', code: 'SR1' }]) }

    it 'returns a esception' do
      expect { checkout }.to raise_error StandardError, "Don't exist this rule"
    end
  end

  context 'with wrong format rule' do
    subject(:checkout) { described_class.new(name: 'cpo', code: 'SR1') }

    it 'returns a esception' do
      expect { checkout }.to raise_error StandardError, 'Pricing rules is not an array'
    end
  end

  context 'without rules' do
    subject(:checkout) { described_class.new }

    it { expect(checkout.class).to eq described_class }
  end

  context 'without empty rules' do
    subject(:checkout) { described_class.new [] }

    it { expect(checkout.class).to eq described_class }
  end

  describe '#scan' do
    include_context 'with correct data'

    it 'increment an element in basket' do
      checkout.scan tea
      expect(checkout.basket.items).to eq [tea]
    end
  end

  describe '#total' do
    include_context 'with correct data'

    context 'without pricing_rules' do
      before do
        checkout.scan tea
        checkout.scan strawberries
        checkout.scan coffee
      end

      it { expect(checkout.total).to eq 19.34 }
    end

    context 'with Basket: GR1,SR1,GR1,GR1,CF1' do
      before do
        checkout.scan tea
        checkout.scan strawberries
        checkout.scan tea
        checkout.scan tea
        checkout.scan coffee
      end

      it 'returns total 22.45' do
        expect(checkout.total).to eq 22.45
      end
    end

    context 'with Basket:  GR1,GR1 ' do
      before do
        checkout.scan tea
        checkout.scan tea
      end

      it 'returns total 22.45' do
        expect(checkout.total).to eq 3.11
      end
    end

    context 'with Basket: SR1,SR1,GR1,SR1' do
      before do
        checkout.scan strawberries
        checkout.scan strawberries
        checkout.scan tea
        checkout.scan tea
        checkout.scan strawberries
      end

      it 'returns total 22.45' do
        expect(checkout.total).to eq 16.61
      end
    end

    context 'with Basket: GR1,CF1,SR1,CF1,CF1' do
      before do
        checkout.scan tea
        checkout.scan coffee
        checkout.scan strawberries
        checkout.scan coffee
        checkout.scan coffee
      end

      it 'returns total 22.45' do
        expect(checkout.total).to eq 30.57
      end
    end
  end
end
