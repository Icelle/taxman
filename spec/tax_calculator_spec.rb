require 'rspec'
require_relative '../lib/tax_calculator.rb'
require_relative '../lib/liability.rb'
require_relative '../lib/employee.rb'

#determine taxes owed or refunds due.

describe TaxCalculator do
  it 'returns instance of the Liability class' do
    employee = Employee.new({first_name: 'John', last_name: 'Smith', annual_income: 120000, tax_paid: 28000, tax_rate: 38})
    tax_calculator = TaxCalculator.new(employee)
    expect(TaxCalculator.liability(employee)).to be_an_instance_of(Liability)
  end
end
