shy = Prawn::Text::SHY #to insert soft hyphen interpolate use #{shy}
pdf.default_leading 5

# Header
pdf.move_down 20
pdf.font("Helvetica", size: 16)
pdf.text "<u>AUTHORIZATION FOR INDIVIDUALS</u>", style: :bold, align: :center, inline_format: true
# Body
pdf.bounding_box([20, pdf.cursor], width: 490, height: 100) do
  pdf.move_down 40
  pdf.font_size 12
  pdf.text "D./Dña #{@order.first_name} #{@order.last_name}, autorizo/a a que 'MATRICULA EL COCHE' retire del Concesionario: #{@order.shop} la documentación original de mi vehículo para proceder a su matriculación."
end
# Signature
pdf.move_down 40
pdf.bounding_box([40, pdf.cursor], width: 260, height: 100) do
  pdf.text "Firmado: __________________"
end
pdf.bounding_box([300, pdf.cursor+100], width: 290, height: 100) do
  pdf.text "Fecha: ___________________"
end
