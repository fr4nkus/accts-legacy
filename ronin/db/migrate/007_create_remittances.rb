class CreateRemittances < ActiveRecord::Migration
  def self.up
	  create_table :remittances, :options=>"default charset=utf8" do |t|
		  t.column "daybook_id", :integer, :null => false
		  t.column "agent_id", :integer, :null => false
		  t.column "notes", :text
	  end
  end

  def self.down
	  drop_table :remittances
  end
end
