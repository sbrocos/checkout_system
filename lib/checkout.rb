# frozen_string_literal: true

class Checkout
  attr_reader :basket

  def initialize
    @basket = []
  end

  def scan(item)
    @basket.push item
  end

  def total
    basket.sum(&:price)
  end
end
