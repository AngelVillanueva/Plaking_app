class StatesController < ApplicationController
  before_filter :signed_in_user, only: [:index, :new, :destroy, :edit, :update]
  before_filter :admin_user, only: [:index, :new, :destroy, :edit, :update]

  def index
    @states = State.paginate(page: params[:page], order: :id, per_page: 10)
  end
  
  def new
    @state = State.new
  end
  
  def create
    @state = State.new(params[:state])
    
    if @state.save
      flash[:success] = "New State successfully created"
      redirect_to states_path
    else
      flash.now[:error] = "Error saving the State"
      render :new
    end
  end
  
  def edit
    @state = State.find(params[:id])
  end
  
  def update
    @state = State.find(params[:id])
    
    if @state.update_attributes(params[:state])
      flash[:success] = "State successfully updated"
      redirect_to states_path
    else
      flash.now[:error] = "Error updating the State"
      render :edit
    end
  end
  
  def destroy
    State.find(params[:id]).destroy
    flash[:success] = "State successfully deleted"
    redirect_to states_path
  end
  
  def check
    @state = State.new
    @states = State.all.collect{ |s| [s.name, s.id] }.sort_by{|e| e[1]}
  end
  def checking
  	@id = params[:state][:name]
  	@match = State.find(@id)
  	if @match
  	  @match.requests = @match.requests + 1
  	  @match.save
  	end
  	if @match && @match.covered
  	  session[:state] = @match
      flash[:success] = I18n.t("This State is covered")
      redirect_to new_quote_path
    else
      flash[:error] = I18n.t("Sorry, this State is not covered")
      redirect_to root_path
    end
  end
end