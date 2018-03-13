class Money
  attr_accessor :amount
  attr_reader :currency

  def initialize(amount, currency)
    @amount = amount
    @currency = currency
  end

  def equals(money)
    @amount == money.amount && @currency == money.currency
  end

  def times(multiplier)
    Money.new(@amount * multiplier, currency)
  end

  def plus(addend)
    Money.new(amount + addend.amount, currency)
  end

  class << self
    def dollar(amount)
      Money.new(amount, 'USD')
    end

    def franc(amount)
      Money.new(amount, 'CHF')
    end
  end
end
