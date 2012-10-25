require 'spec_helper'

describe "StatePages" do
  subject { page }
  let(:success_text) { "This State is covered" }
  let(:error_text) { "Sorry, this State is not covered" }
  let(:button_text) { "Check State" }
  let(:field_label) { "state_name" }
    
  describe "State model" do
    before do
      #@state = FactoryGirl.create(:state)
      @state = State.find(1)
    end
    
    subject { @state }
    it { should respond_to :name }
    it { should respond_to :covered }
    it { should respond_to :cities }
    it { should respond_to :cp_prefix }
    it { should respond_to :requests }
    it { should be_valid }
    
    describe "State should have a name" do
      before { @state.name = "" }
      it { should_not be_valid }
    end
  end
  
  describe "Check page" do
    before do
      @state_available = State.find_by_name("Barcelona")
      @state_not_available = State.find_by_name("Albacete")
	  visit root_path   	
	  end
    
    it { should have_selector('h3', text: "4 simple steps") }
    it { should have_content(@state_available.name) }
    
    it "should confirm that a state is available" do
      reqs = @state_available.requests
      select @state_available.name, from: field_label
      click_button button_text
      page.should have_content success_text
      page.should_not have_content error_text
      page.should have_selector('h1', text: "New Quote for #{@state_available.name} State")
      @state_available.reload
      @state_available.requests.should == reqs + 1
    end
    it "should notice that a state is not available" do
      reqs_n = @state_not_available.requests
      select @state_not_available.name, from: field_label
      click_button button_text
      page.should have_content error_text
      page.should_not have_content success_text
      @state_not_available.reload
      @state_not_available.requests.should == reqs_n + 1
    end
  end
  
end
