class CreateInvoiceTypes < ActiveRecord::Migration
  def self.up
	  create_table :invoice_types, :options=>"default charset=utf8" do |t|
		  t.column "name", :string, :null=>false
	  end
  end

  def self.down
	  drop_table :invoice_types
  end
end
