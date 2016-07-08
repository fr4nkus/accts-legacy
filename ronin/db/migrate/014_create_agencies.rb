class CreateAgencies < ActiveRecord::Migration
  def self.up
	  create_table :agents, :options=>"default charset=utf8" do |t|
		  t.column "name", :string, :null=>false
	  end
  end

  def self.down
	  drop_table :agents
  end
end
