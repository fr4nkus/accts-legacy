class ExpenseItem < ActiveRecord::Base
	belongs_to :expense
	belongs_to :expense_type
end
