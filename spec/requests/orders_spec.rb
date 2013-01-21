require 'spec_helper'

describe "Orders" do
  describe "the Model" do
    let(:black_order) { Order.new }
    let(:quote) { FactoryGirl.create(:quote) }
    let(:status) { FactoryGirl.create(:status) }
    let(:user) { FactoryGirl.create(:user) }
    let(:order) { FactoryGirl.create(:order, quote: quote, status: status, user: user) }
    let(:business_order) { FactoryGirl.create(:order, owner: "Business", registered_name: "Sinapse SL", cif: "B64862600") }

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
    it "should have a valid owner" do
      order.owner = "Merlin"
      order.should_not be_valid
    end
    it "should have a business or personal owner" do
      order.owner = "Personal"
      order.should be_valid
    end
    it "should have a registered name if Business owner" do
      business_order.registered_name = ""
      business_order.should_not be_valid
    end
    it "should have a CIF if Business owner" do
      business_order.cif = ""
      business_order.should_not be_valid
    end
    it "should have a valid CIF if any" do
      business_order.cif = "00000000L"
      business_order.should_not be_valid
    end
    it "should have a gender" do
      order.gender = ""
      order.should_not be_valid
    end
    it "should have a NIF" do
      order.nif = ""
      order.should_not be_valid
    end
    it "should have a valid NIF" do
      order.nif = "00000000L"
      order.should_not be_valid
    end
    it "should have a salesman" do
      order.shop_salesman = ""
      order.should_not be_valid
    end
    it "should have a shop phone" do
      order.shop_phone = ""
      order.should_not be_valid
    end
    
    
    
    subject { order }
    it { should respond_to :owner }
    it { should respond_to :registered_name }
    it { should respond_to :cif }
    it { should respond_to :first_name }
    it { should respond_to :last_name }
    it { should respond_to :gender }
    it { should respond_to :nif }
    it { should respond_to :address }
    it { should respond_to :email }
    it { should respond_to :phone_number }
    it { should respond_to :shop }
    it { should respond_to :shop_salesman }
    it { should respond_to :shop_phone }
    it { should respond_to :status }
    it { should respond_to :quote }
    it { should respond_to :user_id }
    it { should respond_to :clip }
    its(:quote) { should == quote }
    its(:status) { should == status }
    its(:user) { should == user }
    it { should be_valid }
    
  end
end
