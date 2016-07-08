class Invoice < ActiveRecord::Base
	has_many :invoice_items
	has_and_belongs_to_many :remittance
	belongs_to :contract

  def number
    self.id.to_s.sprintf( '%06d' )
  end 
end
