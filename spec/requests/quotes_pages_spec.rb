require 'spec_helper'

describe "Quotes" do

  describe "The model" do
    before { @quote = Quote.new}
    
    subject { @quote }
    
    it { should respond_to :cc_engine }
    it { should respond_to :number_cylinders }
    it { should respond_to :stroke }
    it { should respond_to :plaking_date }
    
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
  end

end

describe "QuotesPages" do
  subject { page }
  
  describe "New Quote page" do
    before do
      visit new_quote_path
    end
    
    #it { should have_selector('h1', text: heading_text) }

  end
  
end