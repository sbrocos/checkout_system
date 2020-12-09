# frozen_string_literal: true

class Item
  attr_reader :product_code, :price

  def initialize(product_code, product_name, product_price)
    @product_code = product_code
    @name = product_name
    @price = product_price
  end
end
