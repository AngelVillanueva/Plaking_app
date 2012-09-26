# == Schema Information
#
# Table name: quote_concepts
#
#  id          :integer          not null, primary key
#  symbol      :string(255)
#  net_amount  :decimal(10, 2)
#  tax_id      :integer
#  show_before :boolean
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  for_car     :boolean          default(TRUE)
#  for_ciclo   :boolean          default(TRUE)
#  for_moto    :boolean          default(TRUE)
#  ordering    :integer
#

class QuoteConcept < ActiveRecord::Base
  attr_accessible :symbol, :net_amount, :tax_id, :show_before, :for_car, :for_ciclo, :for_moto, :ordering
  belongs_to :tax
  
  validates :symbol, :net_amount, :tax_id, :ordering, presence: true
  
  def vat_tax
    BigDecimal(net_amount * Tax.find(tax_id).percentage / 100).round(2)
  end

end
