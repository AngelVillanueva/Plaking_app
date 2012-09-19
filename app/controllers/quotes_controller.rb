class QuotesController < ApplicationController
  
  def new
    @quote = Quote.new
    @state = State.find(session[:state])
    @cities = @state.cities.collect{ |c| [c.name, c.id] }
    @vehicles = ["Turismo", "Ciclomotor", "Motocicleta"]
    @strokes = {"2 tiempos" => 2 , "4 tiempos" => 4}
  end
  
  def create
    # build up some temp variables to be used in the calculations
    cc_engine = params[:quote][:cc_engine].to_i
    n_cylinders = params[:quote][:number_cylinders].to_i
    stroke = params[:quote][:stroke].to_i
    anho = params[:quote]["plaking_date(1i)"].to_i
    month = params[:quote]["plaking_date(2i)"].to_i
    city_id = params[:quote][:city_id]
    vehicle_type = params[:quote][:vehicle]
    
    # determine the vehicle category to be used to recover the right list price
    potencia = return_potencia_fiscal(cc_engine, n_cylinders, stroke) # returns integer for a car and 0 if not a car
    vehicle_code = return_vehicle_code(vehicle_type, potencia, cc_engine) # returns Ax (cars) or Fx (not cars) code to look in the prices table
    vehicle = Vehicle.find_by_code(vehicle_code)
  
    # calculate the quote amount based on city, vehicle_category and plaking_date
    list_price = Price.find_by_city_id_and_vehicle_id(city_id, vehicle.id)
    date_modifier = return_quarter(month) # list price is adjusted depending on the remaining quarters for the year
    amount = BigDecimal(list_price.price * date_modifier, 10).round(2)
    
    # rebuild the params for the Quote creation
    revised_params = params[:quote]
    revised_params.delete(:vehicle) # to avoid massive assignment error
    revised_params.delete(:city_id) # idem
    
    @quote = Quote.new(revised_params)
    @quote.city_id = city_id
    @quote.vehicle_id = vehicle.id
    @quote.amount = amount
    
    # save and redirect
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
    def return_potencia_fiscal(cc_engine, number_cylinders, stroke)
      if cc_engine == 0 || number_cylinders == 0 || stroke == 0
        0
      else
        factor = (stroke == 4 && 0.08) || 0.11
        ((cc_engine / number_cylinders) ** 0.6) * factor * number_cylinders
      end
    end
    def return_vehicle_code(type, potencia, cc_engine)
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
            else
              "A5"
          end
        when "Motocicleta"
          case cc_engine
            when 0..125
              "F2"
            when 126..250
              "F3"
            when 251..500
              "F4"
            when 501..1000
              "F5"
            else
              "F6"
          end
        else
          "F1"
      end
    end

end