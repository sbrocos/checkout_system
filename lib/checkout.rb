# frozen_string_literal: true

class Checkout
  attr_reader :basket

  def initialize(pricing_rules = nil)
    @basket = Basket.new pricing_rules
  end

  def scan(item)
    @basket.add_item item
  end

  def total
    (basket.total - basket.total_discount).to_f
  end
end
