class CreateInvoiceItem < ActiveRecord::Migration
  def self.up
	  create_table :invoice_items, :options => "default charset=utf8" do |t|
	     t.integer "invoice_id", :null=> false
	     t.column "rate_id", :integer, :null=> false
	     t.column "units", :float, :null=> false
	     t.column "vatable", :boolean, :null=> false
	     t.column "description", :integer, :null=> false
	     t.column "date", :date, :null=> false
          end
  end

  def self.down
	  drop_table :invoice_items
  end
end
