class CreateTempInvoiceUnits  < ActiveRecord::Migration

  def self.up
    change_table :temp_invoice_items do |t|
	t.column "units", :float, :null=>true
    end
  end

  def self.down
    remove_column :temp_invoice_items, :units
  end

end
