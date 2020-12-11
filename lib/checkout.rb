# frozen_string_literal: true

class Checkout
  attr_reader :basket

  def initialize(pricing_rules = nil)
    validate_rules(pricing_rules)
    @basket = Basket.new pricing_rules
  end

  def scan(item)
    @basket.add_item item
  end

  def total
    Numbers.currency(basket.total - basket.total_discount)
  end

  private

  def validate_rules(pricing_rules)
    return if pricing_rules.nil? || pricing_rules.empty?

    raise StandardError, 'Pricing rules is not an array' if pricing_rules.class.name != 'Array'

    pricing_rules.each do |rule|
      raise StandardError, "Don't exist this rule" unless rule_name?(rule)
    end
  end

  def rule_name?(rule)
    Rules.methods.include? "#{rule[:name]}_rule".to_sym
  end
end
