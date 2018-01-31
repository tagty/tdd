class Money
  attr_accessor :amount

  def initialize(amount)
    @amount = amount
  end

  def equals(money)
    @amount == money.amount
  end

  class << self
    def dollar(amount)
      Dollar.new(amount)
    end

    def franc(amount)
      Franc.new(amount)
    end
  end
end
