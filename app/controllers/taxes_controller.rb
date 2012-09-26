class TaxesController < ApplicationController
  before_filter :signed_in_user
  before_filter :admin_user

  def index
    @taxes = Tax.all
  end
  
  def new
    @tax = Tax.new
  end
  
  def create
    @tax = Tax.new(params[:tax])
    
    if @tax.save
      flash[:success] = t(:new_tax_success)
      redirect_to taxes_path
    else
      flash[:error] = t(:new_tax_error)
      redirect_to new_tax_path
    end
  end
  
  def edit
    @tax = Tax.find(params[:id])
  end
  
  def update
    @tax = Tax.find(params[:id])
    
    if @tax.update_attributes(params[:tax])
      flash[:success] = t(:tax_edition_success)
      redirect_to taxes_path
    else
      flash[:error] = t(:tax_edition_error)
      redirect_to edit_tax_path(@tax)
    end
  end
  
  def destroy
    Tax.find(params[:id]).destroy
    flash[:success] = t(:tax_deleted_success)
    redirect_to taxes_path
  end

end