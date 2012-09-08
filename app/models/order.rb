# == Schema Information
#
# Table name: orders
#
#  id           :integer          not null, primary key
#  first_name   :string(255)
#  last_name    :string(255)
#  address      :string(255)
#  email        :string(255)
#  phone_number :string(255)
#  quote_id     :integer
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  status_id    :integer
#  shop         :string(255)
#

class Order < ActiveRecord::Base
  attr_accessible :first_name, :last_name, :address, :email, :phone_number, :shop, :status_id
  belongs_to :quote
  belongs_to :status
  
  validates :first_name, :last_name, :address, :shop, :quote_id, :status_id, presence: true
end