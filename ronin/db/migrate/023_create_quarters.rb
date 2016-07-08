class CreateQuarters  < ActiveRecord::Migration

  def self.up
    create_table :quarters do |t|
        t.column "yq", :integer, :null => false
        t.column "quarter", :integer, :null => false
        t.column "year", :timestamp, :null => false
        t.column "starts", :timestamp, :null => false
        t.column "ends", :timestamp, :null => false
    end
  end

  def self.down
    drop_table :quarters
  end

end
