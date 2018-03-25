class Sum
  attr_accessor :augend, :addend
  def initialize(augend, addend)
    self.augend = augend
    self.addend = addend
  end
  def reduce(bank, to)
    amount = augend.amount + addend.amount
    Money.new(amount, to)
  end
end
