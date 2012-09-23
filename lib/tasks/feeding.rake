# the following to be entered in test console
# require 'rake'
# LlorensApp::Application.load_tasks # <-- MISSING LINE
# Rake::Task['my_task'].invoke

namespace :feed do

  desc 'Feeding States'
  task :states do
    FastSeeder.seed_csv!(State, "states.csv", :id, :name, :cp_prefix, :covered, :requests => 0, :created_at => "23-09-2012", :updated_at => "23-09-2012")
  end
  
  desc 'Feeding Cities'
  task :cities do
    FastSeeder.seed_csv!(City, "cities.csv", :id, :name, :state_id, :created_at => "23-09-2012", :updated_at => "23-09-2012")
  end
  
  desc 'Feeding Vehicles'
  task :vehicles do
    FastSeeder.seed_csv!(Vehicle, "types.csv", :id, :code, :name, :created_at => "23-09-2012", :updated_at => "23-09-2012")
  end
  
  desc 'Feeding Prices'
  task :prices do
    FastSeeder.seed_csv!(Price, "prices.csv", :id, :vehicle_id, :city_id, :price, :year, :created_at => "23-09-2012", :updated_at => "23-09-2012")
  end
  
  desc 'Feeding Quote Concepts'
  task :concepts do
    FastSeeder.seed_csv!(QuoteConcept, "concepts.csv", :id, :symbol, :net_amount, :tax_id, :show_before, :created_at => "23-09-2012", :updated_at => "23-09-2012")
  end
  
  desc 'Feeding Taxes'
  task :taxes do
    FastSeeder.seed_csv!(Tax, "taxes.csv", :id, :symbol, :percentage, :created_at => "23-09-2012", :updated_at => "23-09-2012")
  end
  
  desc 'Run all feedings'
  task :all => [:states, :cities, :vehicles, :prices, :concepts, :taxes]
  
  task :default => :all
  
end