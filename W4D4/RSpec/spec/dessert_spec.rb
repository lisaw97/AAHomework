require 'rspec'
require 'dessert'

=begin
Instructions: implement all of the pending specs (the `it` statements without blocks)! Be sure to look over the solutions when you're done.
=end

describe Dessert do
  subject(:icecream) { Dessert.new("icecream", 2, "lisa")}
  let(:chef) { double("chef") }

  describe "#initialize" do
    it "sets a type"
      expect(icecream.type).to eq("icecream")
    end

    it "sets a quantity"
      expect(icecream.quantity).to eq(2)
    end

    it "starts ingredients as an empty array"
      expect(icecream.ingredients).to be(empty)
    end

    it "raises an argument error when given a non-integer quantity"
      expect { Dessert.new("icecream", "hi", "Lisa") }.to raise_error(ArgumentError)
    end
  end

  describe "#add_ingredient" do
    it "adds an ingredient to the ingredients array"
      icecream.add_ingredient("cream")
      expect(icecream.ingredients.to eq(["cream"]))
    end
  end

  describe "#mix!" do
    it "shuffles the ingredient array"
      icecream.mix!
      expect(icecream.ingredients).to eq(ingredients.shuffle)
    end
  end

  describe "#eat" do
    it "subtracts an amount from the quantity"
      icecream.eat(1)
      expect(icecream.quantity).to eq(1)
    end

    it "raises an error if the amount is greater than the quantity"
      expect { icecream.eat(3) }.to raise_error('not enough left!')
    end
  end

  describe "#serve" do
    it "contains the titleized version of the chef's name"
      expect(icecream.serve).to eq("Lisa has made 2 icecreams!")
    end
  end

  describe "#make_more" do
    it "calls bake on the dessert's chef with the dessert passed in"
      allow(chef).to recieve(:bake).and_return("baked!")
      expect do 
        icecream.make_more
      end.to_not raise_exception
    end
  end

end
