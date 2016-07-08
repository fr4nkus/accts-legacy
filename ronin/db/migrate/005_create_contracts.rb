class CreateContracts < ActiveRecord::Migration
  def self.up
	  create_table :contracts, :options =>"default charset=utf8" do |t|
	     t.column "starts", :date, :null=>false
	     t.column "ends", :date, :null=>false
	     t.column "agent_id", :integer, :null=>false
	     t.column "client_id", :integer, :null=>false
	  end
	     
  end

  def self.down
	  drop_table :contracts
  end
end
