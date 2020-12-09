# frozen_string_literal: true

class Checkout
  attr_reader :basket

  def initialize
    @basket = Basket.new
  end

  def scan(item)
    @basket.add_item item
  end

  def total
    basket.items.sum(&:price)
  end
end
