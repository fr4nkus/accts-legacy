class Employees < ActiveRecord::Base
	has_many :expenses
end
