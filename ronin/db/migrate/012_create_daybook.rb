class CreateDaybook < ActiveRecord::Migration
  def self.up
	  create_table :daybooks, :options=>"default charset=utf8" do |t|
		  t.column "action_date", :date, :null=>false
		  t.column "debit", :boolean, :null=>false
		  t.column "desc", :string, :null=>false
		  t.column "amount", :float, :null=>false
	  end
  end

  def self.down
	  drop_table :daybooks
  end
end
