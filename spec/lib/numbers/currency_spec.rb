# frozen_string_literal: true

require 'bigdecimal'
require './spec/spec_helper'
require './lib/numbers/currency'

RSpec.describe Numbers do
  describe '.currency' do
    subject(:currency) { described_class.currency(decimal) }

    context 'whit a o like decimal' do
      let(:decimal) { BigDecimal('0') }

      it 'returns a float number' do
        expect(currency).to eq 0.0
      end
    end

    context 'whit decimal no t 0' do
      let(:decimal) { BigDecimal('34') }

      it 'returns a float number' do
        expect(currency).to eq 34.0
      end
    end
  end
end
