class CreateEmployees < ActiveRecord::Migration
  def self.up
	  create_table :employees, :options=>"default charset=utf8" do |t|
		  t.column "login", :string, :null=>false
		  t.column "first_name", :string, :null=>true
		  t.column "last_name", :string, :null=>false
	  end
  end

  def self.down
	  drop_table :employees
  end
end
