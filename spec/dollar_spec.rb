require 'dollar'

RSpec.describe Dollar do
  describe "#times" do
    context "times repeatedly" do
      it "gets correct amount" do
        five = Dollar.new(5)
        product = five.times(2)
        expect(product.amount).to eq 10
        product = five.times(3)
        expect(product.amount).to eq 15
      end
    end
  end

  describe "#equals" do
    context "check equality" do
      it "gets equal amount" do
        expect(true).to eq Dollar.new(5).equals(Dollar.new(5))
      end

      it "gets not equal amount" do
        expect(false).to eq Dollar.new(5).equals(Dollar.new(6))
      end
    end
  end
end
