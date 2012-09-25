class VehicleInstance
  attr_accessor :cc_engine, :number_cylinders, :type
  
  def initialize(cc = 0, number = 0, type = "Ciclomotor")
    @cc_engine = cc
    @number_cylinders = number
    @type = type
  end
  
  def stroke
    4
  end
  
  def tax_power
    if cc_engine == 0 || cc_engine.nil? || number_cylinders == 0 || number_cylinders.nil? || stroke == 0 || stroke.nil?
      0
    else
      factor = (stroke == 4 && 0.08) || 0.11
      ((cc_engine / number_cylinders) ** 0.6) * factor * number_cylinders
    end
  end
  
  def vehicle_id
    Vehicle.where(code: vehicle_code).first.id
  end
  
  def vehicle_code
    case type
      when "Turismo"
        case tax_power
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