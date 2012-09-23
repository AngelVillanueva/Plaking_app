require 'spec_helper'

describe "Quote Concepts" do

  describe "The Model" do
    let(:iva) { Tax.new }
    let(:concept) { QuoteConcept.new }
    before { concept.tax = iva }
    subject { concept }
    
    it { should respond_to :symbol }
    it { should respond_to :net_amount }
    it { should respond_to :tax_id }
    it { should respond_to :show_before }
    its(:tax) { should == iva }
    
  end

end