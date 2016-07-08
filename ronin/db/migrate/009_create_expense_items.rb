class CreateExpenseItems < ActiveRecord::Migration
  def self.up
	  create_table :expense_items, :options=>"default charset=utf8" do |t|
		  t.column "expense_id", :integer, :null=>false
		  t.column "cost", :float, :null=>false
		  t.column "description", :text, :null=>false
		  t.column "expense_type_id", :text, :null=>false
		  t.column "vatable", :boolean, :null=>false
	  end
  end

  def self.down
	  drop_table :expense_items
  end
end
