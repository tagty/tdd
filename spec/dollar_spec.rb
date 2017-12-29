require 'dollar'

RSpec.describe Dollar, "#times" do
  context "multiplication" do
    it "times dollar" do
      five = Dollar.new(5)
      five.times(2)
      expect(five.amount).to eq 10
    end
  end
end
