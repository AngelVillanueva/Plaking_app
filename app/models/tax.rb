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
  has_many :quote_concepts

end
