tratamiento = @order.gender==1 && "D." || "Dña."

shy = Prawn::Text::SHY #to insert soft hyphen interpolate use #{shy}
pdf.default_leading 5

# Header
pdf.move_down 20
pdf.font("Helvetica", size: 16)
pdf.text "<u>DOCUMENTO DE REPRESENTACIÓN DE PERSONAS JURÍDICAS</u>", style: :bold, align: :center, inline_format: true