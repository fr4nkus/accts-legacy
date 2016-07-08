class Expense < ActiveRecord::Base

  has_many :expense_items
  belongs_to :employee
  belongs_to :approved,
        :class_name => "Employee",
        :foreign_key => "approved_employee_id"

  def gross
    gross = 0.0

    for item in self.expense_items 

      unless item.net.nil?
        gross += item.net
      end

      unless item.vat.nil?
        gross += item.vat
      end

    end

    return gross
  end

end
