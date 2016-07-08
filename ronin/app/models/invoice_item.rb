class InvoiceItem < ActiveRecord::Base
	belongs_to :invoice
	belongs_to :invoice_rate
end
