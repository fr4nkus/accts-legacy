class AlterQuartersYear  < ActiveRecord::Migration

  def self.up
    remove_column :quarters, :year
    add_column :quarters, :year, :integer, :null => false
  end

  def self.down
    remove_column :quarters, :year
    add_column :quarters, :year, :timestamp, :null => false
  end

end
