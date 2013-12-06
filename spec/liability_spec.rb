require 'rspec'
require_relative '../lib/liability.rb'
require_relative '../lib/tax_calculator.rb'
require_relative '../lib/employee.rb'

#Liability must expose three properties: employee, amount_due and amount_owed.

describe Liability do

  it 'calculates amount due' do
    employee = Employee.new({first_name: 'John', last_name: 'Smith', annual_income: 120000, tax_paid: 28000, tax_rate: 38})
    expect(TaxCalculator.liability(employee).amount_due).to eql(45600.0)
  end

  it 'calculates amount owed' do
    employee = Employee.new({first_name: 'John', last_name: 'Smith', annual_income: 120000, tax_paid: 28000, tax_rate: 38})
    expect(TaxCalculator.liability(employee).amount_owed).to eql(-17600.0)
  end
end
