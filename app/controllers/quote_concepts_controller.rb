class QuoteConceptsController < ApplicationController
  before_filter :signed_in_user
  before_filter :admin_user

  def index
    @concepts = QuoteConcept.all
  end

  def new
    @concept = QuoteConcept.new
  end
  
  def create
    @concept = QuoteConcept.new(params[:quote_concept])
    
    if @concept.save
      flash[:success] = t(:new_concept_success)
      redirect_to quote_concepts_path
    else
      flash.now[:error] = t(:new_concept_error)
      render :new
    end
  end
  
  def edit
    @concept = QuoteConcept.find(params[:id])
  end
  
  def update
    @concept = QuoteConcept.find(params[:id])
    
    if @concept.update_attributes(params[:quote_concept])
      flash[:success] = t(:concept_edition_success)
      redirect_to quote_concepts_path
    else
      flash.now[:error] = t(:concept_edition_error)
      render :edit
    end
  end
  
  def destroy
    QuoteConcept.find(params[:id]).destroy
    flash[:success] = t(:concept_deleted_success)
    redirect_to quote_concepts_path
  end

end