# == Schema Information
#
# Table name: vehicles
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  code       :string(255)
#

class Vehicle < ActiveRecord::Base
  attr_accessible :name, :code
  has_many :prices
  has_many :quotes
  
  validates :name, :code, presence: true
end
