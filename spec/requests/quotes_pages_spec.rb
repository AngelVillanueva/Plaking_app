require 'spec_helper'

describe "QuotesPages" do
  subject { page }
  
  describe "New Quote page" do
    before do
      visit new_quote_path
    end
    
    #it { should have_selector('h1', text: heading_text) }

  end
  
end