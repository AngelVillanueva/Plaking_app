class OrdersController < ApplicationController
  before_filter :signed_up_user, only: [:show, :new, :create, :edit, :update]
  before_filter :correct_user, only: [:show]

  def show
    @order = Order.find(params[:id])
    
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @order }
      format.pdf  { render :layout => false }
    end
  end
  def new
    @order = Order.new
  end
  def create
    @order = Order.new(params[:order])
    @order.quote_id = session[:quote]
    @order.status_id = 1 # correct order but not paid yet
    @order.user = current_user
    
    if @order.save
      redirect_to @order, notice: "Thanks for your Order"
    else
      flash.now[:error] = "Error saving the order"
      render :new
    end
  end
  def edit
    @order = Order.find(params[:id])
    @statuses = Status.all.collect{|s| [s.name, s.id] }
  end
  def update
    @order = Order.find(params[:id])
    
    if @order.update_attributes(params[:order])
      redirect_to @order, notice: "The order was updated with the new status"
    else
      flash.now[:error] = "Error updating the order"
      render :edit
    end
  end
  
  private
  def correct_user
    @order = current_user.orders.find_by_id(params[:id])
    redirect_to root_url if @order.nil?
  end
end