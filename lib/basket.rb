# frozen_string_literal: true

class Basket
  attr_reader :items

  def initialize
    @items = []
    @total = 0
    @discounts = 0
  end

  def add_item(item)
    items.push(item)
  end

  def items_by_code(code)
    items.select { |item| item.product_code == code }
  end
end
