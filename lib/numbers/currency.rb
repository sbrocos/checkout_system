# frozen_string_literal: true

module Numbers
  class << self
    def currency(decimal)
      format('%.2f', decimal).to_f
    end
  end
end
