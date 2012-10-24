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

 # Returns current_page?
   def class_if_link(this_page, title ="")
   	 case this_page
   	 	when 'home'
   	 		" class=active" if current_page? '/'
   	 	when 'account'
   	 		" class=active" if current_page? "/users/#{current_user.id}"
   	 	when 'admin'
   	 		" active" if title.include?("Admin")
   	 	end
   end
   
end
