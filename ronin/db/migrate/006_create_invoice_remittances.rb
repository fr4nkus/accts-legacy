class CreateInvoiceRemittances < ActiveRecord::Migration
  def self.up
	  create_table :invoices_remittances, :options=>"default charset=utf8" do |t|
		  t.column "invoice_id", :integer, :null=>false
		  t.column "remittance_id", :integer, :null=>false
	  end
  end

  def self.down
	  drop_table :invoices_remittances
  end
end
