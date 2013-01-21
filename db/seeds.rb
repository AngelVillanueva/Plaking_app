# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# admin user precreated, could be used in production
admin_user = User.new
admin_user.name = "Admin"
admin_user.email = "info@sinapse.es"
admin_user.password = "foobar"
admin_user.password_confirmation = "foobar"
admin_user.save!
admin_user.toggle!(:admin)
admin_user.save!
# fake common user just for development
common_user = User.new
common_user.name = "Usuario"
common_user.email = "avillanueva@sinapse.es"
common_user.password = "foobar"
common_user.password_confirmation = "foobar"
common_user.save!

# status precreated, could be used in production
status_one = Status.new
status_one.name = "Pending authorization"
status_one.save!
status_two = Status.new
status_two.name = "Authorization delivered"
status_two.save!
status_three = Status.new
status_three.name = "Waiting for Plaking number"
status_three.save!
status_four = Status.new
status_four.name = "Temporary Plaking number get"
status_four.save!
status_five = Status.new
status_five.name = "Original documentation get"
status_five.save!
status_six = Status.new
status_six.name = "Original documentation delivered"
status_six.save!

# fake quotes for development
quote_one = Quote.new
quote_one.cc_engine = 1400
quote_one.number_cylinders = 4
quote_one.stroke = 4
quote_one.plaking_date = "01-01-2013"
quote_one.city_id = 1
quote_one.vehicle_id = 1
quote_one.amount = 100
quote_one.save!

quote_two = Quote.new
quote_two.cc_engine = 1400
quote_two.number_cylinders = 4
quote_two.stroke = 4
quote_two.plaking_date = "01-01-2013"
quote_two.city_id = 2
quote_two.vehicle_id = 2
quote_two.amount = 200
quote_two.save!


# fake orders for development
personal_order = Order.new
personal_order.first_name = "Usuario"
personal_order.last_name = "De prueba"
personal_order.email = "usuario@example.com"
personal_order.phone_number = "900000000"
personal_order.address = "Rambla Jujol, 15"
personal_order.quote_id = quote_one.id
personal_order.status_id = status_one.id
personal_order.shop = "Automoviles 2000, SL"
personal_order.user_id = common_user.id
personal_order.owner = "Personal"
personal_order.gender = 1
personal_order.nif = "00000000T"
personal_order.shop_salesman = "Esteban Comercial"
personal_order.shop_phone = "600000000"
personal_order.save!

business_order = Order.new
business_order.first_name = "Usuario"
business_order.last_name = "De prueba"
business_order.email = "usuario@example.com"
business_order.phone_number = "900000000"
business_order.address = "Rambla Jujol, 15"
business_order.quote_id = quote_two.id
business_order.status_id = status_one.id
business_order.shop = "Automoviles 2000, SL"
business_order.user_id = common_user.id
business_order.owner = "Business"
business_order.gender = 1
business_order.nif = "00000000T"
business_order.shop_salesman = "Esteban Comercial"
business_order.shop_phone = "600000000"
business_order.company_address = "Arquitecto Vandelvira, 8"
business_order.cif = "A12345674"
business_order.registered_name = "Sinapse Consulting SL"
business_order.save!


