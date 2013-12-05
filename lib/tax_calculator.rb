class TaxCalculation
  TAX_RATE = 0.22

  def liability(employee)
    calculate_liability = calculate_liability
    if calculate_liability < 0.0
      puts "#{employee.first_name} #{employee.last_name} will receive a refund of #{calculate_liability.abs}"
    else
      puts "#{employee.first_name} #{employee.last_name} has tax liability of #{calculate_liability.abs}"
    end
  end

  private
  def self.calculate_liability(employee)
    owe= employee.annual_income * TAX_RATE
    paid = employee.tax_paid
    (paid- owe).to_i
  end
end

class Employee
  attr_reader :first_name, :last_name, :annual_income, :tax_paid
  def initialize(data)
    @first_name = data[:first_name]
    @last_name = data[:last_name]
    @annual_income= data.fetch[:annual_income, 0]  #if value is not there, it'll put a 0.
    @tax_paid = data[:tax_paid]
  end
end

data.each do |data|
  employee = Employee.new(data)
  TaxCalulation.tax_liability(employee)  # call liability on the class itself
end

