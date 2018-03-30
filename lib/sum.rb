class Sum
  attr_accessor :augend, :addend
  def initialize(augend, addend)
    self.augend = augend
    self.addend = addend
  end
  def reduce(bank, to)
    amount = augend.reduce(bank, to).amount + addend.reduce(bank, to).amount
    Money.new(amount, to)
  end
end
