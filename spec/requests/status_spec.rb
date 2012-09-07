require 'spec_helper'

describe "Status" do
  describe "the Model" do
    let(:black_status) { Status.new }
    let(:status) { FactoryGirl.create(:status) }

    it "should have all required fields" do
      black_status.should_not be_valid
    end
    it "should have some name" do
      status.name = ""
      status.should_not be_valid
    end
    
    
    subject { status }
    it { should respond_to :name }
    it { should respond_to :orders }
    it { should be_valid }
    
  end
end
