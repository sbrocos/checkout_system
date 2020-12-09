# frozen_string_literal: true
# frozen_string_literal: true

require './spec/spec_helper'
require './lib/item'

RSpec.describe Item do
  subject(:item) { described_class.new 'PR1', 'Product One', 2.00 }

  describe '#price' do
    it 'return a price value' do
      expect(item.price).to eq 2.00
    end
  end

  describe '#product_code' do
    it 'return a string with code of the product' do
      expect(item.product_code).to eq 'PR1'
    end
  end
end
