# == Schema Information
#
# Table name: quotes
#
#  id         :integer          not null, primary key
#  state_id   :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  city       :string(255)
#  vehicle    :string(255)
#

class Quote < ActiveRecord::Base
  
end
