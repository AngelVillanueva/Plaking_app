prawn_document() do |pdf|
  render "auth_ind", pdf: pdf
  pdf.start_new_page
  render "mand_ind", pdf: pdf
end