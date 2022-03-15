require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do
    # validation tests/examples here
    it "product with all fields set will save successfully" do
      @category = Category.new(name: "Grocery")
      @product = Product.new(name: "Purple carrot", price: 10, quantity: 5, category: @category)

      expect(@product).to be_valid
    end

    it "fail if name field is empty" do
      @category = Category.new(name: "Grocery")
      @product = Product.new(name: nil, price: 10, quantity: 5, category: @category) 

      expect(@product).to_not be_valid
      expect(@product.errors.full_messages).to include("Name can't be blank")
    end

    it "fail if price field is empty" do
      @category = Category.new(name: "Grocery")
      @product = Product.new(name: "Purple carrot", price: nil, quantity: 5, category: @category)

      expect(@product).to_not be_valid
      expect(@product.errors.full_messages).to include("Price can't be blank")
    end

    it "fail if quantity field is empty" do
      @category = Category.new(name: "Grocery")
      @product = Product.new(name: "Purple carrot", price: 10, quantity: nil, category: @category)

      expect(@product).to_not be_valid
      expect(@product.errors.full_messages).to include("Quantity can't be blank")
    end

    it "fail if category field is empty" do
      @category = Category.new(name: "Grocery")
      @product = Product.new(name: "Purple carrot", price: 10, quantity: 5, category: nil)

      expect(@product).to_not be_valid
      expect(@product.errors.full_messages).to include("Category can't be blank")
    end

  end

end
