module ApplicationHelper

 # Returns the full title on a per-page basis.       # Documentation comment
   def full_title(page_title)                          # Method definition
     base_title = "Matricula el coche"  # Variable assignment
     if page_title.empty?                              # Boolean test
       base_title                                      # Implicit return
     else
       "#{page_title} | #{base_title}"                 # String interpolation
     end
   end

  # Returns a price in Euro, two digits after decimal point
  def in_euro(number)
    number_to_currency(number, format: "%n %u", precision: 2, unit: "&euro;")
  end
   
end
