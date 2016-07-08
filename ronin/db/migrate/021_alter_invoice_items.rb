class AlterInvoiceItems  < ActiveRecord::Migration

  def self.up
    remove_column :invoice_items, :rate_id
    remove_column :invoice_items, :date

    change_table :invoice_items do |t|
	t.column "rate", :float, :null=>true
	t.column "vat", :float, :null=>true
	t.column "net", :float, :null=>true
	t.column "gross", :float, :null=>true
    end
  end

  def self.down
    remove_column :invoice_items, :rate
    remove_column :invoice_items, :vat
    remove_column :invoice_items, :net
    remove_column :invoice_items, :gross
  end

end
