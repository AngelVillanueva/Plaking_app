class OrdersController < ApplicationController
  def new
    @order = Order.new
  end
  def create
    @order = Order.new(params[:order])
    @order.quote_id = session[:quote]
    @order.status_id = 1 # correct order but not paid yet
    
    if @order.save
      redirect_to root_path, notice: "Thanks for your Order"
    else
      redirect_to new_order_path, notice: "Error saving the order"
    end
  end
end