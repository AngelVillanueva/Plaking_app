# == Schema Information
#
# Table name: cities
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  state_id   :integer
#  created_at :datetime
#  updated_at :datetime
#

class City < ActiveRecord::Base
  attr_accessible :name
  belongs_to :state
  has_many :prices
  has_many :quotes
  
  validates :name, :state_id, presence: true
end
