class CreateExpenses < ActiveRecord::Migration
  def self.up
	  create_table :expenses, :options=>"default charset=utf8" do |t|
		  t.column "start", :date, :null=>false
		  t.column "end", :date, :null=>false
		  t.column "employee_id", :integer, :null=>false
	  end
  end

  def self.down
	  drop_table :expenses
  end
end
