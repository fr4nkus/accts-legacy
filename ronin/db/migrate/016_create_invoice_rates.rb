class CreateInvoiceRates < ActiveRecord::Migration
  def self.up
	  create_table :invoice_rates, :options=>"default charset=utf8" do |t|
		  t.column "units", :string, :null=>false
		  t.column "cost", :float, :null=>false
	end
  end

  def self.down
	  drop_table :invoice_rates
  end
end
