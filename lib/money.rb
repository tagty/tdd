class Money
  attr_accessor :amount
  def initialize(amount)
    @amount = amount
  end
  def equals(money)
    @amount == money.amount
  end
end
