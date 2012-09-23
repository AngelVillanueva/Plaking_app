require 'spec_helper'

describe "Taxes" do
  describe "The Model" do
    let(:tax) { Tax.new }
    subject { tax }
    
    it { should respond_to :symbol }
    it { should respond_to :percentage }
    it { should respond_to :quote_concepts }
  end
end