prawn_document() do |pdf|
  if @order.owner == "Personal"
    render "auth_individuals", pdf: pdf
    pdf.start_new_page
    render "mand_individuals", pdf: pdf
  elsif @order.owner == "Business"
    render "auth_companies", pdf: pdf
    pdf.start_new_page
    render "mand_companies", pdf: pdf
    pdf.start_new_page
    render "cert_esc_companies", pdf: pdf
  end
end