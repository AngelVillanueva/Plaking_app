require 'spec_helper'

describe "Prices" do
  
  describe "The Model" do
    before { @price = FactoryGirl.create(:price) }
    
    subject { @price }
    it {should respond_to :vehicle_id }
    it {should respond_to :city_id }
    it {should respond_to :price }
    it {should respond_to :year }
    it {should be_valid }
    
    describe "should have a list price" do
      before { @price.price = "" }
      it {should_not be_valid }
    end

  end
  
end