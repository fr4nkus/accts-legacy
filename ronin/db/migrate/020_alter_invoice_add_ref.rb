class AlterInvoiceAddRef  < ActiveRecord::Migration

  def self.up
    change_table :invoices do |t|
	t.column "reference", :integer, :null=>true
    end
  end

  def self.down
    remove_column :invoices, :reference
  end

end
