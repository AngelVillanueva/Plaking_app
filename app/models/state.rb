# == Schema Information
#
# Table name: states
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  covered    :boolean
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  cp_prefix  :string(255)
#  requests   :integer          default(0)
#

class State < ActiveRecord::Base
  attr_accessible :name, :covered, :cp_prefix
  has_many :cities
  
  validates :name, :cp_prefix, presence: true
end
