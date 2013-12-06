#determine taxes owed or refund
#must receive an instance of Employee class
#must return instance of the Liability class
require_relative "./liability.rb"

class TaxCalculator
  attr_reader :name, :annual_income, :tax_rate, :tax_paid

  def initialize(employee)
    @name          = name
    @annual_income = annual_income
    @tax_rate      = tax_rate
    @tax_paid      = tax_paid
  end

  # @param [Employee] employee - instance of employee
  # @return [Liabality] employee's liability
  def self.liability(employee)
    return Liability.new(employee)
  end
end
