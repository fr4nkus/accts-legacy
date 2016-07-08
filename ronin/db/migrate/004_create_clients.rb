class CreateClients < ActiveRecord::Migration
  def self.up
     create_table :clients, :options => "default charset=utf8" do |t|
	     t.column "name", :text, :null=> false
     end
  end

  def self.down
      drop_table :clients
  end
end
