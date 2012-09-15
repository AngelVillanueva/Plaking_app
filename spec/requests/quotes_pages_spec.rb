require 'spec_helper'

describe "Quotes" do

  describe "The model" do
    let(:city) { FactoryGirl.create(:city) }
    let(:vehicle) { FactoryGirl.create(:car) }
    
    before { @quote = FactoryGirl.create(:quote, city: city, vehicle: vehicle) }
    
    subject { @quote }
    
    it { should respond_to :cc_engine }
    it { should respond_to :number_cylinders }
    it { should respond_to :stroke }
    it { should respond_to :plaking_date }
    it { should respond_to :city_id }
    it { should respond_to :vehicle_id }
    it { should respond_to :order }
    its(:city) { should == city }
    its(:vehicle) { should == vehicle }
    
    describe "validating fields" do
      before { @quote.amount = "" }
      it { should_not be_valid }
      before do
      	@quote.amount = 99
      	@quote.city = nil
      end
      it { should_not be_valid }
      before do
      	@quote.city = city
      	@quote.vehicle = nil
      end
      it { should_not be_valid }
    end
    describe "accessible attributes" do
      it "should now allow price massive assignment" do
        expect do
          Quote.new(price: 100)
        end.to raise_error(ActiveModel::MassAssignmentSecurity::Error)
      end
      it "should now allow vehicle massive assignment" do
        expect do
          Quote.new(vehicle_id: 1)
        end.to raise_error(ActiveModel::MassAssignmentSecurity::Error)
      end
      it "should now allow city massive assignment" do
        expect do
          Quote.new(city_id: 1)
        end.to raise_error(ActiveModel::MassAssignmentSecurity::Error)
      end
    end
    describe "successful creation" do
      it "should create a new quote record" do
        expect do
          new_quote = FactoryGirl.create(:quote)
          new_quote.save
        end.to change(Quote, :count).by(1)
      end
    end
#    describe "needs CC if car or motorcycle" do
#      before do
#        @quote.vehicle_id = 1
#        @quote.cc_engine = ""
#      end
#      it { should_not be_valid }
#    end
#    describe "needs NCyls if car" do
#      before do
#        @quote.vehicle_id = 1
#        @quote.number_cylinders = ""
#      end
#      it { should_not be_valid }
#    end

  end

end