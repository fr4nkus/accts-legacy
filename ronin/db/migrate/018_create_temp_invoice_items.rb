class CreateTempInvoiceItems  < ActiveRecord::Migration

  def self.up
    create_table :temp_invoice_items, :options=>"default charset=utf8" do |t|
	t.column "inv_date", :timestamp, :null=>false
	t.column "invoice_id", :integer, :null=>true
	t.column "cost", :float, :null=>true
	t.column "vat", :float, :null=>true
	t.column "net", :float, :null=>true
	t.column "gross", :float, :null=>true
	t.column "description", :string, :null=>true
    end
  end

  def self.down
    drop_table :temp_invoice_items
  end

end
