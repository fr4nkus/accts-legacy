class CreateInvoice < ActiveRecord::Migration
  def self.up

    create_table :invoices, :options => "default charset=utf8" do |t|
        t.column "paid", :binary, :null => false
        t.column "contract_id", :integer, :null => false
        t.column "invoiced", :timestamp, :null => false
        t.column "created_at", :timestamp, :null => false
        t.column "updated_at", :timestamp, :null => false
    end
  end

  def self.down
    drop_table :invoices
  end
end
