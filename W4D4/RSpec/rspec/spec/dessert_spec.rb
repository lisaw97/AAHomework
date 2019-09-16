require 'rspec'
require 'dessert'

=begin
Instructions: implement all of the pending specs (the `it` statements without blocks)! Be sure to look over the solutions when you're done.
=end

RSpec.describe Dessert do
  subject(:icecream) {Dessert.new("icecream", 2, "lisa")}
  let(:chef) { double("chef", titleized: "Chef Lisa the Great Baker")}

  describe "#initialize" do
    it "sets a type" do
      expect(icecream.type).to eq("icecream")
    end

    it "sets a quantity" do
      expect(icecream.quantity).to eq(2)
    end

    it "starts ingredients as an empty array" do
      expect(icecream.ingredients).to be_empty
    end

    it "raises an argument error when given a non-integer quantity" do
      expect {Dessert.new("icecream", "2", "lisa")}.to raise_error
    end
  end

  describe "#add_ingredient" do
    it "adds an ingredient to the ingredients array" do
      icecream.add_ingredient("cream")
      expect(icecream.ingredients).to eq(["cream"])
    end
  end

  describe "#mix!" do
    it "shuffles the ingredient array" do 
      icecream.mix!
      expect(icecream.ingredients).to eq(icecream.ingredients.shuffle)
    end
  end

  describe "#eat" do
    it "subtracts an amount from the quantity" do
      icecream.eat(1)
      expect(icecream.quantity).to eq(1)
    end

    it "raises an error if the amount is greater than the quantity" do
      expect {icecream.eat(5)}.to raise_error
    end
  end

  describe "#serve" do
    it "contains the titleized version of the chef's name" do
      expect(icecream.serve).to include("Lisa")
    end
  end

  describe "#make_more" do
    it "calls bake on the dessert's chef with the dessert passed in" do 
      icecream.make_more
      expect(chef).to receive(:bake).with(icecream)
    end 
  end
end
