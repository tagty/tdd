class Sum
  attr_accessor :augend, :addend

  def initialize(augend, addend)
    self.augend = augend
    self.addend = addend
  end

  def times(multiplier)
    Sum.new(augend.times(multiplier), addend.times(multiplier))
  end

  def plus(addend)
    Sum.new(self, addend)
  end

  def reduce(bank, to)
    amount = augend.reduce(bank, to).amount + addend.reduce(bank, to).amount
    Money.new(amount, to)
  end
end
