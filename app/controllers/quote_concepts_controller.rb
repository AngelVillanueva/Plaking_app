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
      flash[:error] = t(:new_concept_error)
      render :new
    end
  end

end