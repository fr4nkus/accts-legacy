class CreateAccounts < ActiveRecord::Migration
  def self.up
	create_table :accounts, :options=>"default charset=utf8" do |t|
	t.column "name", :string, :null=>false
	t.column "sortcode", :string, :null=>true
	t.column "code", :string, :null=>true
	end
end

  def self.down
  drop_table :accounts
  end
end
