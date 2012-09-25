# == Schema Information
#
# Table name: quotes
#
#  id               :integer          not null, primary key
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  cc_engine        :integer
#  number_cylinders :integer
#  stroke           :integer
#  plaking_date     :date
#  amount           :decimal(10, 3)
#  city_id          :integer
#  vehicle_id       :integer
#

class Quote < ActiveRecord::Base
  attr_accessible :cc_engine, :number_cylinders, :plaking_date
  belongs_to :city
  belongs_to :vehicle
  has_one :order
  
  
  validates :amount, :city_id, :vehicle_id, presence: true
  validates :cc_engine, presence: true, if: :needs_cc?
  validates :number_cylinders, presence: true, if: :needs_cyl?
    # validates :stroke, presence: true, if: :needs_cyl? # let's assume that all engines are "4tiempos"
  
  
  private
  def needs_cyl?
    (1..5).include?(vehicle_id)
  end
  def needs_cc?
    (1..5).include?(vehicle_id) || (7..11).include?(vehicle_id)
  end
end
