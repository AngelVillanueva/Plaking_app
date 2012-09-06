# == Schema Information
#
# Table name: quotes
#
#  id               :integer          not null, primary key
#  name             :string(255)
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  cc_engine        :integer
#  number_cylinders :integer
#  stroke           :integer
#  plaking_date     :date
#  amount           :decimal(10, 3)
#  city_id          :integer
#  vehicle_id       :integer
#

class Quote < ActiveRecord::Base
  attr_accessible :cc_engine, :number_cylinders, :stroke, :plaking_date
  
end
