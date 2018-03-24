require 'money'
require 'bank'
require 'sum'

RSpec.describe Money do
  describe "#times" do
    it "gets multiplied dollar" do
      five = Money.dollar 5
      expect(five.times(2).amount).to eq Money.dollar(10).amount
      expect(five.times(3).amount).to eq Money.dollar(15).amount
    end
  end
  describe "#equals" do
    it "gets [equal/not equal] amount" do
      expect(true).to eq Money.dollar(5).equals(Money.dollar(5))
      expect(false).to eq Money.dollar(5).equals(Money.dollar(6))
      expect(false).to eq Money.franc(5).equals(Money.dollar(6))
    end
  end
  describe "#currency" do
    it "has currency" do
      expect("USD").to eq Money.dollar(1).currency
      expect("CHF").to eq Money.franc(1).currency
    end
  end
  describe "#plus" do
    it "gets simple addition" do
      five = Money.dollar 5
      sum = five.plus five
      bank = Bank.new
      reduced = bank.reduce(sum, "USD")
      # using amount
      expect(Money.dollar(10).amount).to eq reduced.amount
    end
  end
end
RSpec.describe Sum do
  describe "#augend, #addend" do
    it "return sum" do
      five = Money.dollar 5
      sum = five.plus five
      expect(sum.augend).to eq five
      expect(sum.addend).to eq five
    end
  end
  describe "#reduce" do
    it "reduce sum" do
      sum = Sum.new(Money.dollar(3), Money.dollar(4))
      bank = Bank.new
      result = bank.reduce(sum, "USD")
      expect(result.amount).to eq Money.dollar(7).amount
    end
  end
end
RSpec.describe Bank do
  describe "#reduce" do
    it "reduce money" do
      bank = Bank.new
      result = bank.reduce(Money.dollar(1), "USD")
      expect(result.amount).to eq Money.dollar(1).amount
    end
  end
end
