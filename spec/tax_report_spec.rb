require 'rspec'
require_relative '../lib/tax_report.rb'
require_relative '../lib/employee.rb'
require_relative '../lib/tax_calculator.rb'
require_relative '../lib/liability.rb'

describe TaxReport do
  it 'outputs employee tax liability' do
    employee = Employee.new({first_name: 'Johnny', last_name: 'Smith', annual_income: 120000, tax_paid: 28000, tax_rate: 38})
    tax_report = TaxReport.new(employee)
    expect(employee.liability.amount_owed).to eql(-17600.0)
  end

  it 'outputs employee refund' do
    employee = Employee.new({first_name: 'Jane', last_name: 'Doe', annual_income: 140000, tax_paid: 30000, tax_rate: 40})
    tax_report = TaxReport.new(employee)
    expect(employee.liability.amount_owed).to eql(-26000.0)
  end
end
