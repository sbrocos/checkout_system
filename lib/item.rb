# frozen_string_literal: true

require 'bigdecimal'

class Item
  attr_reader :product_code, :price

  def initialize(product_code, product_name, product_price)
    @product_code = product_code
    @name = product_name
    @price = BigDecimal product_price.to_s
  end
end
