require 'dollar'
require 'franc'

RSpec.describe Dollar do
  describe "#times" do
    context "repeated multiplication" do
      it "gets multiplied amount" do
        five = Dollar.new(5)
        # Other object was created
        # expect(five.times(2)).to eq Dollar.new(10) 
        expect(five.times(2).amount).to eq Dollar.new(10).amount 
        # expect(five.times(3)).to eq Dollar.new(15)
        expect(five.times(3).amount).to eq Dollar.new(15).amount
      end
    end
  end

  describe "#equals" do
    context "check equality" do
      it "gets [equal/not equal] amount" do
        expect(true).to eq Dollar.new(5).equals(Dollar.new(5))
        expect(false).to eq Dollar.new(5).equals(Dollar.new(6))
      end
    end
  end
end

RSpec.describe Franc do
  describe "#times" do
    context "repeated multiplication" do
      it "gets multiplied amount" do
        five = Franc.new(5)
        expect(five.times(2).amount).to eq Franc.new(10).amount 
        expect(five.times(3).amount).to eq Franc.new(15).amount
      end
    end
  end
end

