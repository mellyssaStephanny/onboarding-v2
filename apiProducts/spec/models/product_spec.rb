require 'rails_helper'

describe Product do

  it "is invalid if an equal product already exists" do 
    product = Product.create(sku: '12345678',  name: 'some name', price: 911.5, 
      barcode: '9876547321', amount: 500, description: 'description')
    product = Product.new(sku: '01234567',  name: 'some name', price: 50.5, 
      barcode: '8574961239', amount: 15, description: 'description new')
    product.valid?
    expect(product.errors[:name]).not_to include('has already been taken')
  end
  
  it "creates a product when data is valid" do 
    product = Product.create(sku: '12345678',  name: 'some name', price: 911.5, 
      barcode: '9876547321', amount: 500, description: 'description')
    product.valid?
  end

  it "returns error when data is invalid" do 
    product = Product.create(sku: "can't be blank", name: "can't be blank", price: "can't be blank",
    barcode: "can't be blank", amount: "can't be blank", description: "can't be blank")
    product.valid?
  end

  it "is valid if name are required" do
    product = Product.new(name: 'Product name') 
  end 

  it "not valid if name is null or empty" do 
    product = Product.new(name: nil) 
    product.valid?   
    expect(product.errors[:name]).not_to include("Require valid name") 
  end

  it "returns error when price is not greater than zero" do 
    product = Product.new(price: nil) 
    product.valid?   
    expect(product.errors[:price]).to include("is not a number") 
  end

  it "returns error when barcode has less than 8 digits" do 
    product = Product.new(barcode: nil) 
    product.valid?   
    expect(product.errors[:barcode]).not_to include("Require lenght valid") 
  end

  it "returns error when barcode has more than 13 digits" do 
    product = Product.new(barcode: nil)
    product.valid?
    expect(product.errors[:barcode]).not_to include("Require lenght valid")
  end

  it "returns error when sku is invalid" do 
    product = Product.new(sku: nil)
    product.valid?   
    expect(product.errors[:sku]).to include("can't be blank")
  end
end





