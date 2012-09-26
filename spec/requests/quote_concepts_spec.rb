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
    it { should respond_to :for_car }
    it { should respond_to :for_ciclo }
    it { should respond_to :for_moto }
    its(:tax) { should == iva }
    
  end

end