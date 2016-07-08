class AlterQuarters  < ActiveRecord::Migration

  def self.up
    remove_column :quarters, :yq
    add_column :quarters, :yq, :integer, :null => false
  end

  def self.down
    remove_column :quarters, :yq
    add_column :quarters, :yq, :timestamp, :null => false
  end

end
