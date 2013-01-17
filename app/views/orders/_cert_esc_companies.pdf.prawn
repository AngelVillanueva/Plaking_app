tratamiento = @order.gender==1 && "D." || "Dña."

shy = Prawn::Text::SHY #to insert soft hyphen interpolate use #{shy}
pdf.default_leading 5

# Header
pdf.image "#{Rails.root}/app/assets/images/pdf/cert.png", position: :center, scale: 0.5
pdf.move_down 40
pdf.font("Helvetica", size: 18)
pdf.bounding_box([80, pdf.cursor], width: 400, height: 50) do
  pdf.text "DOCUMENTO DE REPRESENTACIÓN DE PERSONAS JURÍDICAS", style: :bold, align: :center, inline_format: true
end
pdf.line [0, pdf.cursor], [540, pdf.cursor]
pdf.line_width = 2
pdf.stroke

# Body
pdf.bounding_box([0, pdf.cursor], width: 540, height: 800) do
  pdf.move_down 20
  pdf.font_size 14
  pdf.text "En cumplimiento de lo establecido en el Anexo XIII letra A) 3º del Reglamento General de Vehículos (RD 2822/1998, de 23 de Diciembre), y a los efectos de su presentación ante la Jefatura Provincial/Local de Tráfico de #{@order.quote.city.state.name}, el/los abajo firmantes declara/declaran tener poder suficiente para actuar en nombre y representación de la entidad: #{@order.registered_name} con CIF nº #{@order.cif}, en la tramitación del expediente de matriculación del vehículo matrícula ___________________ (indicar bastidor en caso de matriculación).", align: :justify
  # Signature
  pdf.move_down 40
  pdf.text "Y para que así conste y surta los efectos oportunos,", align: :center
  pdf.move_down 10
  pdf.text "#{@order.quote.city.name}, a ____ de __________________ de #{Time.new.year}", align: :center
  pdf.move_down 5
  pdf.font_size 10
  pdf.text "(firma)", align: :center
  pdf.font_size 14
  pdf.move_down 60
  pdf.text "En caso de Comunidades de Bienes, adjuntar relación de los integrantes de la misma."
  pdf.move_down 10
  pdf.bounding_box([0, pdf.cursor], width: 300, height: 200) do
    pdf.text "NOMBRE Y APELLIDOS", style: :bold, inline_format: true
    pdf.text "#{@order.first_name} #{@order.last_name}"
    pdf.text "______________________________________"
    pdf.text "______________________________________"
  end
  pdf.bounding_box([320, pdf.cursor+200], width: 220, height: 200) do
    pdf.text "DNI", style: :bold, inline_format: true
    pdf.text "#{@order.nif}"
    pdf.text "____________________"
    pdf.text "____________________"
  end
end