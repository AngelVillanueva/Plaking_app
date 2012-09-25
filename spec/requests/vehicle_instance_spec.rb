require 'spec_helper'

describe "Specific Vehicle" do
  describe "The Model" do
    let(:thisVehicle) { VehicleInstance.new }
    subject { thisVehicle }
    
    it { should respond_to :cc_engine }
    it { should respond_to :number_cylinders }
    it { should respond_to :stroke }
    it { should respond_to :type }
    it { should respond_to :tax_power }
    it { should respond_to :vehicle_id }
    
    its(:tax_power) { should == 0 }
    its(:vehicle_id) { should == 6 }
    
    it "should change vehicle_id depending on type" do
      thisVehicle.type = "Ciclomotor"
      thisVehicle.vehicle_id.should == 6
    end
    it "should change vehicle_id depending on type and engine data" do
      thisVehicle.type = "Turismo"
      thisVehicle.cc_engine = 1600
      thisVehicle.number_cylinders = 8
      thisVehicle.vehicle_id.should == 3
    end
    it "should accept some parameters direct assignment" do
      expect do
        VehicleInstance.new(cc_engine: 1600, number_cylinders: 8, type: "Turismo")
      end.not_to raise_error(ActiveModel::MassAssignmentSecurity::Error)
    end
  end
end