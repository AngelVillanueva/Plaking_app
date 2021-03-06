require 'spec_helper'

describe "Prices" do
  
  describe "The Model" do
    before { @price = FactoryGirl.create(:price) }
    
    subject { @price }
    it { should respond_to :vehicle_id }
    it { should respond_to :city_id }
    it { should respond_to :price }
    it { should respond_to :year }
    it { should be_valid }
    
    describe "should have a valid list price" do
      before { @price.price = "" }
      it { should_not be_valid }
    end
    
    describe "accessible attributes" do
      it "should not allow vehicle massive assignment" do
        expect do
          Price.new(vehicle_id: 1)
        end.to raise_error(ActiveModel::MassAssignmentSecurity::Error)
      end
      it "should not allow city massive assignment" do
        expect do
          Price.new(city_id: 1)
        end.to raise_error(ActiveModel::MassAssignmentSecurity::Error)
      end
    end

  end
  
end