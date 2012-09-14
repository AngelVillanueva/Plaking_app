class QuotesController < ApplicationController
  def new
    @quote = Quote.new
    @state = State.find(session[:state])
    @cities = @state.cities.collect{ |c| [c.name, c.id] }
    @vehicles = Vehicle.all.collect{ |v| [v.name, v.id] }
    @strokes = [2,4]
  end
  def create
    myparams = params[:quote]
    thevehi = params[:quote][:vehicle_id]
    thecit = params[:quote][:city_id]
    myparams.delete(:vehicle_id)
    myparams.delete(:city_id)
    
    @quote = Quote.new(myparams)
    @quote.city_id = thecit
    @quote.vehicle_id = thevehi
  
    anho = params[:quote]["plaking_date(1i)"].to_i
    month = params[:quote]["plaking_date(2i)"].to_i
    quarter_mod = return_quarter(month)
    list_price = Price.find(:first, conditions: ["city_id= #{thecit} AND vehicle_id= #{thevehi} AND year = #{anho}"])
    @price = BigDecimal(list_price.price * quarter_mod,10).round(3)
    
    @quote.amount = @price
    if @quote.save
      session[:quote] = @quote.id
      flash.now.notice = "Quote created successfully"
    else
      flash.now[:error] = "Error saving the Quote"
      render 'new'
    end
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
    def potencia_fiscal(cc_engine, number_cylinders, stroke)
      factor = (stroke == 4 && 0.08) || 0.11
      ((cc_engine / number_cylinders) ** 0.6) * factor * number_cylinders
    end 
end