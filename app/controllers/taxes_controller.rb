class TaxesController < ApplicationController

  def index
    @taxes = Tax.all
  end
  
  def new
    
  end

end