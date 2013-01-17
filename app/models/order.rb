# == Schema Information
#
# Table name: orders
#
#  id              :integer          not null, primary key
#  first_name      :string(255)
#  last_name       :string(255)
#  address         :string(255)
#  email           :string(255)
#  phone_number    :string(255)
#  quote_id        :integer
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  status_id       :integer
#  shop            :string(255)
#  user_id         :integer
#  owner           :string(255)
#  company_address :string(255)
#  cif             :string(255)
#  registered_name :string(255)
#  gender          :integer
#  nif             :string(255)
#  shop_salesman   :string(255)
#  shop_phone      :string(255)
#

class Order < ActiveRecord::Base
  attr_accessible :owner, :registered_name, :cif, :first_name, :last_name, :gender, :nif, :address, :email, :phone_number, :shop, :shop_salesman, :shop_phone, :status_id
  belongs_to :quote
  belongs_to :status
  belongs_to :user
  
  validates :first_name, :last_name, :gender, :nif, :address, :shop, :shop_salesman, :shop_phone, :quote_id, :status_id, :user_id, presence: true
  validates :nif, nif: true
  validates :owner, inclusion: {in: %w(Business Personal)}
  validates :registered_name, presence: true, if: :business_owner?
  validates :cif, presence: true, if: :business_owner?
  validates :cif, nif: true, if: :business_owner?
  
  private
  def business_owner?
    owner == "Business"
  end
end
