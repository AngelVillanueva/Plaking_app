require 'spec_helper'

describe "CitiesPages" do
  
  describe "City Model" do
    before do
      @state = FactoryGirl.create(:state)
      @city = @state.cities.build(name: "Abrera")
    end
    
    subject { @city }
    
    it { should respond_to :name }
    it { should respond_to :state_id }
    it { should respond_to :prices }
    its(:state) { should == @state }
    
    it { should be_valid }
    
    describe "should not be valid without name" do
      before { @city.name = "" }
      it { should_not be_valid }
    end
    describe "should not be valid without state_id" do
      before { @city.state_id = nil }
      it { should_not be_valid }
    end
    describe "accessible attributes" do
        it "should not allow access to user_id" do
          expect do
            City.new(state_id: @state.id)
          end.to raise_error(ActiveModel::MassAssignmentSecurity::Error)
        end    
      end

  end
  
end