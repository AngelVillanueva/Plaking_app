require 'spec_helper'

describe "Vehicles" do
  
  describe "The Model" do
    before { @vehicle = FactoryGirl.create(:vehicle) }
    
    subject { @vehicle }
    it {should respond_to :name }
    it {should respond_to :prices }
    it {should respond_to :code}
    it {should be_valid }
    
    describe "should have a name" do
      before { @vehicle.name = "" }
      it {should_not be_valid }
    end
    
    describe "should have a code" do
      before { @vehicle.code = "" }
      it {should_not be_valid }
    end

  end
  
end