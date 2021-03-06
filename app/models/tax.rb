# == Schema Information
#
# Table name: taxes
#
#  id         :integer          not null, primary key
#  symbol     :string(255)
#  percentage :decimal(10, 2)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Tax < ActiveRecord::Base
  attr_accessible :symbol, :percentage
  has_many :quote_concepts

  validates :symbol, :percentage, presence: true
  validates :percentage, numericality: {greater_than_or_equal_to: 0}
end
