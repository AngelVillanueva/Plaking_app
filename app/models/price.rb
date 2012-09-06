# == Schema Information
#
# Table name: prices
#
#  id         :integer          not null, primary key
#  vehicle_id :integer
#  city_id    :integer
#  price      :decimal(10, 3)
#  year       :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Price < ActiveRecord::Base
  attr_accessible :price, :year
  belongs_to :vehicle
  belongs_to :city
  
  validates :vehicle_id, :city_id, :price, :year, presence: true
end
