class StatesController < ApplicationController
  def check
    @state = State.new
    @states = State.all.collect{|s| [s.name, s.id] }
  end
  def checking
  	@id = params[:state][:name]
  	@match = State.find(@id)
  	if @match && @match.covered
  	  session[:state] = @match
      flash[:success] = "This State is covered"
      redirect_to new_quote_path
    else
      flash[:error] = "Sorry, this State is not covered"
      redirect_to root_path
    end
  end
end