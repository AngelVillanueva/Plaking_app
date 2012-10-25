tratamiento = @order.gender==1 && "D." || "Dña."

shy = Prawn::Text::SHY #to insert soft hyphen interpolate use #{shy}
pdf.default_leading 5
pdf.default_leading 0

# Header

# Body
pdf.image "#{Rails.root}/app/assets/images/pdf/header.png", position: :center, scale: 0.5
pdf.bounding_box([20, pdf.cursor], width: 490, height: 800) do
  pdf.move_down 40
  pdf.font_size 10
  pdf.text "#{tratamiento} #{@order.first_name} #{@order.last_name}, con DNI #{@order.nif}, y domicilio legal en __________________, calle #{@order.address}, <b>declara tener poder para actuar en representación de</b> #{@order.registered_name} <b>con CIF</b> #{@order.cif}, en concepto de <b>MANDANTE</b>:", inline_format: true
  pdf.move_down 20
  pdf.text "<b><u>Dice y otorga:</u></b>", inline_format: true
  pdf.move_down 10
  pdf.text "Que confiere <b>MANDATO CON REPRESENTACIÓN</b>, que se regirá por los arts. 1.709 a 1.739 del Código Civil, a favor de D <b>PATRICIA BRUGADA CASULA</b>, Gestor Administrativo en ejercicio, perteneciente al Colegio Oficial de Gestores Administrativos de <b>CATALUNYA</b>, en concepto de <b>MANDATARIO</b>.", inline_format: true
  pdf.move_down 10
  pdf.text "Que el presente MANDATO se confiere al amparo del art. 32.1 de la Ley 30/1992, de 26 de noviembre, de Régimen Jurídico de las Administraciones Públicas y del Procedimiento Administrativo Común (LRJAP), y del artículo 1 del Estatuto Orgánico de la Profesión de Gestor Administrativo, aprobado por Decreto 424/1963, para que promueva, solicite y realice toda clase de trámites, en relación con el asunto siguiente:", inline_format: true
  pdf.move_down 10
  pdf.text "______________"*4, align: :center
  pdf.move_down 10
  pdf.text "Que el presente MANDATO incluye las actuaciones contenidas en el art. 32.3 de la LRJAP, es decir, formular solicitudes, entablar recursos, desistir de acciones y renunciar a derechos.", inline_format: true
  pdf.move_down 10
  pdf.text "Que el presente MANDATO se confiere para su actuación ante todos los órganos y entidades de la Administración del Estado, Autonómica y Local que resulten competentes, en relación con los trámites del asunto referenciado, y específicamente ante la Jefatura Provincial de Tráfico.", inline_format: true
  pdf.move_down 10
  pdf.text "Que el presente MANDATO mantendrá su vigencia mientras no sea expresamente revocado y comunicada fehacientemente su revocación al mandatario.", inline_format: true
  pdf.move_down 10
  pdf.text "Que declara bajo su responsabilidad que entrega al Gestor Administrativo los documentos necesarios y exigidos por la normativa vigente, que son auténticos y su contenido enteramente correcto.", inline_format: true
  pdf.move_down 10
  pdf.text "Que asimismo autoriza al mandatario para que nombre sustituto para la tramitación del asunto en caso de necesidad justificada, siempre a favor de un Gestor Administrativo en ejercicio.", inline_format: true
  pdf.move_down 10
  pdf.text "Que conoce y acepta que los datos que se suministran por medio del presente MANDATO se incorporarán a unos ficheros automatizados de datos, de los que son responsables el Gestor Administrativo al que se le otorga el mandato y el Colegio Oficial de Gestores Administrativos de CATALUNYA, con objeto de posibilitar la eficaz prestación de sus servicios profesionales y, en su caso, el servicio canalizado de presentación de documentos, pudiendo ejercitar los derechos de acceso, cancelación y rectificación, de conformidad con la Ley Orgánica 15/1999, de 13 de diciembre.", inline_format: true
  # Signature
  pdf.move_down 15
  pdf.text "En #{@order.quote.city.name}, a _____ de ______________ del #{Time.new.year}", align: :center
  pdf.move_down 5
  pdf.text "EL MANDANTE", align: :center
  pdf.move_down 15
  pdf.text "Acepto EL MANDATO y declaro bajo mi responsabilidad que los documentos recibidos del mandante han sido verificados y son correctos los datos contenidos en los mismos."
  pdf.move_down 10
  pdf.text "En _______________, a _____ de ______________ del #{Time.new.year}", align: :center
  pdf.move_down 5
  pdf.text "EL MANDATARIO", align: :center
  pdf.move_down 15
  pdf.text "Gestor Administrativo", align: :center
  pdf.text "Nº de colegiado <b>3191</b>", align: :center, inline_format: true
end