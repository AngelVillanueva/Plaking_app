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
      redirect_to new_status_path, alert: "Error saving the Status"
    end
  end
end