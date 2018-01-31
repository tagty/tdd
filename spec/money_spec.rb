require 'dollar'
require 'franc'

RSpec.describe Money do
  describe "#times" do
    context "repeated multiplication" do
      it "gets multiplied dollar" do
        five = Money.dollar(5)
        # Other object was created
        # expect(five.times(2)).to eq Money.dollar(10) 
        expect(five.times(2).amount).to eq Money.dollar(10).amount 
        expect(five.times(3).amount).to eq Money.dollar(15).amount
      end

      it "gets multiplied franc" do
        five = Money.franc(5)
        expect(five.times(2).amount).to eq Money.franc(10).amount 
        expect(five.times(3).amount).to eq Money.franc(15).amount
        expect(five.times(3).amount).to eq Money.dollar(15).amount
      end
    end
  end

  describe "#equals" do
    context "test equality" do
      it "gets [equal/not equal] amount" do
        expect(true).to eq Money.dollar(5).equals(Money.dollar(5))
        expect(false).to eq Money.dollar(5).equals(Money.dollar(6))
        expect(true).to eq Money.franc(5).equals(Money.franc(5))
        expect(false).to eq Money.franc(5).equals(Money.franc(6))
        expect(false).to eq Money.franc(5).equals(Money.dollar(6))
      end
    end
  end  
end
