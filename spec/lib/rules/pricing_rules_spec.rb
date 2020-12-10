# frozen_string_literal: true

require './spec/spec_helper'
require './lib/rules/pricing_rules'
require './lib/item'

RSpec.describe Rules do
  describe '.ceo_rule' do
    subject(:ceo_rule) { described_class.ceo_rule(items) }

    context 'with only one item' do
      let(:items) do
        [
          Item.new('GR1', 'Green tea', 3.11)
        ]
      end

      it 'returns a zero' do
        expect(ceo_rule).to eq 0
      end
    end

    context 'with only two items' do
      let(:items) do
        [
          Item.new('GR1', 'Green tea', 3.11),
          Item.new('GR1', 'Green tea', 3.11)
        ]
      end

      it 'returns a price of one item' do
        expect(ceo_rule).to eq 3.11
      end
    end

    context 'with only three items' do
      let(:items) do
        [
          Item.new('GR1', 'Green tea', 3.11),
          Item.new('GR1', 'Green tea', 3.11),
          Item.new('GR1', 'Green tea', 3.11)
        ]
      end

      it 'returns a price of one item' do
        expect(ceo_rule).to eq 3.11
      end
    end
  end

  describe '.coo_rule' do
    subject(:coo_rule) { described_class.coo_rule(items) }

    context 'with less 3 items' do
      let(:items) do
        [
          Item.new('SR1', 'Strawberries', 5.00),
          Item.new('SR1', 'Strawberries', 5.00)
        ]
      end

      it 'returns a zero' do
        expect(coo_rule).to eq 0
      end
    end

    context 'with 3 items' do
      let(:items) do
        [
          Item.new('SR1', 'Strawberries', 5.00),
          Item.new('SR1', 'Strawberries', 5.00),
          Item.new('SR1', 'Strawberries', 5.00)
        ]
      end

      it 'returns a price of one item' do
        expect(coo_rule).to eq 1.5
      end
    end

    context 'with more 3 items' do
      let(:items) do
        [
          Item.new('SR1', 'Strawberries', 5.00),
          Item.new('SR1', 'Strawberries', 5.00),
          Item.new('SR1', 'Strawberries', 5.00),
          Item.new('SR1', 'Strawberries', 5.00)
        ]
      end

      it 'returns a price of one item' do
        expect(coo_rule).to eq 2
      end
    end
  end

  describe '.cto_rule' do
    subject(:cto_rule) { described_class.cto_rule(items) }

    context 'with less 3 items' do
      let(:items) do
        [
          Item.new('CF1', 'Coffee', 11.23),
          Item.new('CF1', 'Coffee', 11.23)
        ]
      end

      it 'returns a zero' do
        expect(cto_rule).to eq 0
      end
    end

    context 'with 3 items' do
      let(:items) do
        [
          Item.new('CF1', 'Coffee', 11.23),
          Item.new('CF1', 'Coffee', 11.23),
          Item.new('CF1', 'Coffee', 11.23)
        ]
      end

      it 'returns a price of one item' do
        expect(cto_rule).to eq 11.23
      end
    end

    context 'with more 3 items' do
      let(:items) do
        [
          Item.new('CF1', 'Coffee', 11.23),
          Item.new('CF1', 'Coffee', 11.23),
          Item.new('CF1', 'Coffee', 11.23),
          Item.new('CF1', 'Coffee', 11.23)
        ]
      end

      it 'returns a price of one item' do
        expect(cto_rule).to eq 14.97
      end
    end
  end
end
