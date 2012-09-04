# == Schema Information
#
# Table name: vehicles
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Vehicle < ActiveRecord::Base
  attr_accessible :name
  has_many :prices
  
  validates :name, presence: true
end
