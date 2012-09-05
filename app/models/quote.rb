# == Schema Information
#
# Table name: quotes
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  state_id   :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  city       :string(255)
#  vehicle    :string(255)
#

class Quote < ActiveRecord::Base
  attr_accessible :cc_engine, :number_cylinders, :stroke, :plaking_date
  
end