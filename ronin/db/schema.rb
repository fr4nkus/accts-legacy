# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of Active Record to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 25) do

  create_table "accounts", :force => true do |t|
    t.string "name",     :null => false
    t.string "sortcode"
    t.string "code"
  end

  create_table "agents", :force => true do |t|
    t.string "name", :null => false
  end

  create_table "clients", :force => true do |t|
    t.string "name", :null => false
  end

  create_table "contracts", :force => true do |t|
    t.date    "starts",    :null => false
    t.date    "ends",      :null => false
    t.integer "agent_id",  :null => false
    t.integer "client_id", :null => false
  end

  create_table "daybooks", :force => true do |t|
    t.date    "action_date", :null => false
    t.boolean "debit",       :null => false
    t.string  "desc",        :null => false
    t.float   "amount",      :null => false
  end

  create_table "employees", :force => true do |t|
    t.string "login",      :null => false
    t.string "first_name"
    t.string "last_name",  :null => false
  end

  create_table "expense_items", :force => true do |t|
    t.integer  "expense_id",                       :null => false
    t.float    "net",             :default => 0.0
    t.text     "supplier",                         :null => false
    t.integer  "expense_type_id",                  :null => false
    t.float    "vat",             :default => 0.0
    t.datetime "expense_date",                     :null => false
    t.integer  "invoice_att",     :default => 0
  end

  create_table "expense_types", :force => true do |t|
    t.string  "name",        :null => false
    t.text    "description", :null => false
    t.boolean "vatable",     :null => false
  end

  create_table "expenses", :force => true do |t|
    t.date    "period_end",                         :null => false
    t.integer "employee_id",                        :null => false
    t.integer "approved_employee_id",               :null => false
    t.string  "cheque_number",        :limit => 45, :null => false
  end

  create_table "invoice_items", :force => true do |t|
    t.integer "invoice_id",  :null => false
    t.float   "units",       :null => false
    t.float   "rate"
    t.float   "vat"
    t.float   "net"
    t.float   "gross"
    t.string  "description"
  end

  create_table "invoice_rates", :force => true do |t|
    t.string "units", :null => false
    t.float  "cost",  :null => false
  end

  create_table "invoice_types", :force => true do |t|
    t.string "name", :null => false
  end

  create_table "invoices", :force => true do |t|
    t.date     "paid"
    t.integer  "contract_id", :null => false
    t.datetime "invoiced",    :null => false
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
    t.integer  "reference"
  end

  create_table "invoices_remittances", :force => true do |t|
    t.integer "invoice_id",    :null => false
    t.integer "remittance_id", :null => false
  end

  create_table "mileage_claims", :force => true do |t|
    t.datetime "period_end",                         :null => false
    t.integer  "employee_id",                        :null => false
    t.integer  "approved_employee_id",               :null => false
    t.string   "cheque_number",        :limit => 45, :null => false
    t.float    "rate",                               :null => false
  end

  create_table "mileages", :force => true do |t|
    t.datetime "travel_date",      :null => false
    t.float    "miles"
    t.integer  "mileage_claim_id", :null => false
    t.string   "detail",           :null => false
  end

  create_table "quarters", :force => true do |t|
    t.integer  "quarter", :null => false
    t.datetime "starts",  :null => false
    t.datetime "ends",    :null => false
    t.integer  "yq",      :null => false
    t.integer  "year",    :null => false
  end

  create_table "remittances", :force => true do |t|
    t.integer "daybook_id", :null => false
    t.integer "agent_id",   :null => false
    t.text    "notes"
  end

  create_table "temp_invoice_items", :force => true do |t|
    t.datetime "inv_date",    :null => false
    t.integer  "invoice_id"
    t.float    "cost"
    t.float    "vat"
    t.float    "net"
    t.float    "gross"
    t.string   "description"
    t.float    "units"
  end

end
