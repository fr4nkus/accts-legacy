class AlterInvItemsDesc  < ActiveRecord::Migration

  def self.up
    #remove_column :invoice_items, :vatable
    remove_column :invoice_items, :description

    change_table :invoice_items do |t|
	t.column "description", :string, :null=>true
    end
  end

  def self.down
    add_column :invoice_items, :vatable
  end

end
