# frozen_string_literal: true

require './lib/rules/pricing_rules'

class Basket
  include ::Rules
  attr_reader :items

  def initialize(pricing_rules = nil)
    @items = []
    @rules = pricing_rules
  end

  def add_item(item)
    items.push(item)
  end

  def items_by_code(code)
    items.select { |item| item.product_code == code }
  end

  def total
    Numbers.currency(items.sum(&:price))
  end

  def total_discount
    return 0 if @rules.nil?
    sum_item = @rules.sum do |rule|
      Rules.public_send("#{rule[:name]}_rule", items_by_code(rule[:code])).to_f
    end
    Numbers.currency(sum_item)
  end
end
