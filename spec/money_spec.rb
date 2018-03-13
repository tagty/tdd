require 'money'
require 'bank'

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
