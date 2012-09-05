class QuotesController < ApplicationController
  def new
    @quote = Quote.new
    @state = State.find(session[:state])
    @cities = @state.cities.collect{ |c| [c.name, c.id] }
    @vehicles = Vehicle.all.collect{ |v| [v.name, v.id] }
    @strokes = [2,4]
  end
  def create
    anho = params[:quote]["plaking_date(1i)"].to_i
    month = params[:quote]["plaking_date(2i)"].to_i
    quarter_mod = return_quarter(month)
    list_price = Price.find(:first, conditions: ["city_id= #{params[:quote][:city]} AND vehicle_id= #{params[:quote][:vehicle]} AND year = #{anho}"])
    @price = BigDecimal(list_price.price * quarter_mod,10).round(3)
  end
  
  private
    def return_quarter(a_month)
      case a_month
        when 1..3
          1
        when 4..6
          0.75
        when 7..9
          0.5
        when 10..12
          0.25
        else
          1
      end
    end
end