require 'spec_helper'

describe "Orders" do
  describe "the Model" do
    let(:black_order) { Order.new }
    let(:quote) { FactoryGirl.create(:quote) }
    let(:status) { FactoryGirl.create(:status) }
    let(:user) { FactoryGirl.create(:user) }
    let(:order) { FactoryGirl.create(:order, quote: quote, status: status, user: user) }

    it "should have all required fields" do
      black_order.should_not be_valid
    end
    it "should have some status" do
      order.status = nil
      order.should_not be_valid
    end
    it "should have a quote_id" do
      order.quote_id = ""
      order.should_not be_valid
    end
    
    
    subject { order }
    it { should respond_to :first_name }
    it { should respond_to :last_name }
    it { should respond_to :address }
    it { should respond_to :email }
    it { should respond_to :phone_number }
    it { should respond_to :shop }
    it { should respond_to :status }
    it { should respond_to :quote }
    it { should respond_to :user_id }
    its(:quote) { should == quote }
    its(:status) { should == status }
    its(:user) { should == user }
    it { should be_valid }
    
  end
end
