def select_month(date, options)
  date        = Date.parse(date)
  base_dom_id = get_base_dom_id_from_label_tag(options[:from])

  find(:xpath, ".//select[@id='#{base_dom_id}_1i']").select(date.year.to_s)
  find(:xpath, ".//select[@id='#{base_dom_id}_2i']").select(I18n.l date, :format => '%B')
end