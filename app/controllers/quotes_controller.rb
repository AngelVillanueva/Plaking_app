class QuotesController < ApplicationController
  def new
    @quote = Quote.new
    @state = State.find(session[:state])
    @cities = @state.cities.collect{ |c| [c.name, c.id] }
    @vehicles = ["Turismo", "Ciclomotor", "Motocicleta"]
    #@vehicles = Vehicle.all.collect{|v| [v.name, v.id] }
    @strokes = [2,4]
  end
  def create
    myparams = params[:quote]
    #thevehi = params[:quote][:vehicle_id]
    thevehi = type_to_vehicle(params[:quote][:vehicle])
    #thevehi = tovehicle_id(tovehicle(myparams[:vehicle_id], potencia_fiscal(myparams[:cc_engine].to_i, myparams[:number_cylinders].to_i, myparams[:stroke].to_i)))
    thecit = params[:quote][:city_id]
    myparams.delete(:vehicle)
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
      flash[:error] = "Error saving the Quote"
      redirect_to :new_quote
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
      if cc_engine == 0 || number_cylinders == 0 || stroke == 0
        0
      else
        factor = (stroke == 4 && 0.08) || 0.11
        ((cc_engine / number_cylinders) ** 0.6) * factor * number_cylinders
      end
    end
    def tovehicle(type, potencia)
      case type
        when "Turismo"
          case potencia
            when 0..7.99
              "A1"
            when 8..11.99
              "A2"
            when 12..15.99
              "A3"
            when 16..19.99
              "A4"
            default
              "A5"
          end
        when "Motocicleta"
          case number_cylinders
            when 0..125
              "F2"
            when 126..250
              "F3"
            when 251..500
              "F4"
            when 501..1000
              "F5"
            default
              "F6"
          end
        else
          "F1"
      end
    end
    def tovehicle_id(code)
      Vehicle.find_by_code(code).id
    end
    def type_to_vehicle(type)
      case type
        when "Turismo"
          1
        when "Ciclomotor"
          6
        when "Motocicleta"
          7
        else
          6
      end
    end
end