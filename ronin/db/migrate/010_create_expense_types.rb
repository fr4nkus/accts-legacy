class CreateExpenseTypes < ActiveRecord::Migration
  def self.up
	  create_table :expense_types, :options=>"default charset=utf8" do |t|
		  t.column "name", :string, :null=>false
		  t.column "description", :text, :null=>false
		  t.column "vatable", :boolean, :null=>false
	  end
  end

  def self.down
	  drop_table :expense_types
  end
end
