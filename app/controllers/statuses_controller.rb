class StatusesController < ApplicationController
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
      flash.now.alert = "Error saving the Status"
      render 'new'
    end
  end
end