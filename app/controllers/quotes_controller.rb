class QuotesController < ApplicationController
  def new
    @quote = Quote.new
    @state = State.find(session[:state])
    @cities = @state.cities.collect{ |c| [c.name, c.id] }
    @vehicles = Vehicle.all.collect{ |v| [v.name, v.id] }
  end
  def create
    anho = Time.new.year
    @list_price = Price.find(:first, conditions: ["city_id= #{params[:quote][:city]} AND vehicle_id= #{params[:quote][:vehicle]} AND year = #{anho}"])
  end
end