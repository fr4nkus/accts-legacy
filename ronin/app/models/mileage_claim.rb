class MileageClaim < ActiveRecord::Base
    has_many :mileages
    belongs_to :employee
    belongs_to :approved, 
        :class_name => "Employee", 
        :foreign_key => "approved_employee_id"
    
  def amount
    amount = 0.0
    
    self.mileages.find( :all ).each do |m|
      amount += (self.rate * m.miles )
    end
    
    amount
  end
  
  def prepopulate_mileages
    v = 0
    ld = self.period_end.day
    
    ( 1 ... ld ).each do |day|
      
        d = Date::civil( self.period_end.year, self.period_end.month, day )
        next if d.cwday >= 6
        
#        if d.cwday == 3
#          miles = 88
#          detail = 'Travel to work'
#        elsif day > 17 and v == 0 
#          miles = 100
#          detail = 'Travel to agents'
#          v = 1
#        else
          miles = 8.8
          detail = 'Travel to station'
#        end
                
        self.mileages.push( Mileage.new( { 
            :travel_date => d,
            :miles => miles,
            :detail => detail
            }
          )
        )
      end
    
  end
    
end
