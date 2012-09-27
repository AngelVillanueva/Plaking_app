class StatusesController < ApplicationController
  before_filter :signed_in_user, only: [:index, :new, :create]
  before_filter :admin_user, only: [:index, :new, :create]
  
  def index
    @statuses = Status.all
  end
  def new
    @status = Status.new
  end
  def create
    @status = Status.new(params[:status])
    
    if @status.save
      redirect_to statuses_path, notice: "New Status added"
    else
      flash.now[:error] = "Error saving the Status"
      render :new
    end
  end
end