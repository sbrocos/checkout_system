# frozen_string_literal: true

module Rules
  class << self
    def ceo_rule(items)
      num_to_discount = items.size / 2
      return 0 if num_to_discount.zero?

      num_to_discount * items.first.price
    end

    def coo_rule(items)
      return 0 if items.size < 3

      items.size * 0.5
    end

    def cto_rule(items)
      return 0 if items.size < 3

      new_price = items.first.price * (1.0 / 3.0)
      (items.size * new_price).round(2)
    end
  end
end
