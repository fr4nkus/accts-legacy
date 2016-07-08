class AddMileage < ActiveRecord::Migration

  def self.up
    create_table :mileages, :options=>"default charset=utf8" do |t|
	t.column "travel_date", :timestamp, :null=>false
	t.column "miles", :float, :null=>true
	t.column "mileage_claim_id", :integer, :null=>true
	t.column "rate", :float, :null=>true
	t.column "detail", :string, :null=>true
    end
  end

  def self.down
    drop_table :mileages
  end

end
