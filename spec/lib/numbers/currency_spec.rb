# frozen_string_literal: true

require './spec/spec_helper'

RSpec.describe Numbers do
  describe '.currency' do
    subject(:currency) { described_class.currency(decimal) }

    context 'with a o like decimal' do
      let(:decimal) { BigDecimal('0') }

      it 'returns a float number' do
        expect(currency).to eq 0.0
      end
    end

    context 'with decimal no t 0' do
      let(:decimal) { BigDecimal('34') }

      it 'returns a float number' do
        expect(currency).to eq 34.0
      end
    end
  end
end
