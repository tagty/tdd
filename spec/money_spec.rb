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

    it "times sum" do
      five_bucks = Money.dollar 5
      ten_francs = Money.franc 10
      bank = Bank.new
      bank.add_rate("CHF", "USD", 2)
      sum = Sum.new(five_bucks, ten_francs).times 2
      result = bank.reduce(sum, "USD")
      expect(result.amount).to eq Money.dollar(20).amount
      expect(result.currency).to eq Money.dollar(20).currency
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
      expect(Money.dollar(10).amount).to eq reduced.amount
    end

    it "return sum" do
      five = Money.dollar 5
      sum = five.plus five
      expect(sum.augend).to eq five
      expect(sum.addend).to eq five
    end

    it "plus sum of money" do
      five_bucks = Money.dollar 5
      ten_francs = Money.franc 10
      bank = Bank.new
      bank.add_rate("CHF", "USD", 2)
      sum = Sum.new(five_bucks, ten_francs).plus(five_bucks)
      result = bank.reduce(sum, "USD")
      expect(result.amount).to eq Money.dollar(15).amount
      expect(result.currency).to eq Money.dollar(15).currency
    end
  end

  describe "#reduce" do
    it "reduce sum" do
      sum = Sum.new(Money.dollar(3), Money.dollar(4))
      bank = Bank.new
      result = bank.reduce(sum, "USD")
      expect(result.amount).to eq Money.dollar(7).amount
    end

    it "reduce money" do
      bank = Bank.new
      result = bank.reduce(Money.dollar(1), "USD")
      expect(result.amount).to eq Money.dollar(1).amount
    end

    it "reduce different currency" do
      bank = Bank.new
      bank.add_rate "CHF", "USD", 2
      result = bank.reduce Money.franc(2), "USD"
      expect(result.amount).to eq Money.dollar(1).amount
      expect(result.currency).to eq Money.dollar(1).currency
    end

    it "returns mixed addition" do
      five_bucks = Money.dollar 5
      ten_francs = Money.franc 10
      bank = Bank.new
      bank.add_rate("CHF", "USD", 2)
      result = bank.reduce(five_bucks.plus(ten_francs), "USD")
      expect(result.amount).to eq Money.dollar(10).amount
      expect(result.currency).to eq Money.dollar(10).currency
    end
  end

  describe "#rate" do
    it "returns identity rate" do
      expect(Bank.new.rate("USD", "USD")).to eq 1
    end
  end
end
