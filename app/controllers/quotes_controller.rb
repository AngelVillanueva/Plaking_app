class QuotesController < ApplicationController
  
  def new
    @quote = Quote.new
    @state = State.find(session[:state])
    @cities = @state.cities.collect{ |c| [c.name, c.id] }
    @vehicles = ["Turismo", "Ciclomotor", "Motocicleta"]
      #@strokes = {"2 tiempos" => 2 , "4 tiempos" => 4} # let's assume that all engines are "4tiempos"
  end
  
  def create
    # build up some temp variables to be used in the calculations
    cc_engine = params[:quote][:cc_engine].to_i
    n_cylinders = params[:quote][:number_cylinders].to_i
      # stroke = params[:quote][:stroke].to_i # let's assume that all engines are "4tiempos"
    anho = params[:quote]["plaking_date(1i)"].to_i
    month = params[:quote]["plaking_date(2i)"].to_i
    city_id = params[:quote][:city_id]
    vehicle_type = params[:quote][:vehicle]
    
    # determine the vehicle category to be used to recover the right list price
    vehicle = VehicleInstance.new(cc_engine, n_cylinders, vehicle_type)
  
    # calculate the ivtm tax based on city, vehicle_category and plaking_date
    list_price = Price.find_by_city_id_and_vehicle_id(city_id, vehicle.vehicle_id)
    ivtm_tax = BigDecimal(list_price.price * date_modifier(month), 10).round(2)
    
    # calculate each line for the Quote   
        relevant_concepts = QuoteConcept.where(relevant_vehicle(vehicle_type) => "true")
        total_net = 0
        total_vat = 0
        relevant_concepts.each do |c|
          total_net += c.net_amount
          total_vat += c.vat_tax
        end
    
    # creates quotes lines hash
    @quote_lines = relevant_concepts.collect { |v| [v.symbol, v.net_amount] }
    
    # rebuild the params for the Quote creation
    revised_params = params[:quote]
    revised_params.delete(:vehicle) # to avoid massive assignment error
    revised_params.delete(:city_id) # idem
    
    @quote = Quote.new(revised_params)
    @quote.city_id = city_id
    @quote.vehicle_id = vehicle.vehicle_id
      @quote.amount = total_net + ivtm_tax + total_vat
    @ivtm = ivtm_tax
    @vat_tax = total_vat
    
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
    def date_modifier(a_month)
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
    def relevant_vehicle(type)
      case type
        when "Turismo"
          :for_car
        when "Ciclomotor"
          :for_ciclo
        when "Motocicleta"
          :for_moto
      end
    end

end