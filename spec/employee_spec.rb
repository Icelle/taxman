require 'rspec'
require_relative '../lib/employee.rb'

#tests an Employee class to represent each employee in your dataset.

#tests must verify that you can instantiate your class when all expected data is present as well as handle the cases where some are missing.

describe Employee do
  it 'we can create an Employee' do
    employee = Employee.new({first_name: 'a', last_name: 'b', annual_income: 10, tax_paid: 20, tax_rate: 30})
    expect(employee.class).to eql (Employee)
    expect(employee.first_name).to eql('a')
    expect(employee.last_name).to eql('b')
    expect(employee.annual_income).to eql(10)
    expect(employee.tax_paid).to eql(20)
    expect(employee.tax_rate).to eql(30)
  end

  it 'can change symbols to readable strings' do
    employee = Employee.new({first_name: 'a', last_name: 'b', annual_income: 10, tax_paid: 20, tax_rate: 30})
    expect(employee.symbol_to_readable_string(:last_name)).to eql("[Last Name]")
    expect(employee.symbol_to_readable_string(:super_long_name)).to eql("[Super Long Name]")
  end

  it 'will set numbers to 0 when sent nil' do
    employee = Employee.new({first_name: 'a', last_name: 'b', annual_income: nil, tax_paid: nil, tax_rate: nil})
    expect(employee.annual_income).to eql(0)
    expect(employee.tax_paid).to eql(0)
    expect(employee.tax_rate).to eql(0)
  end

  it 'will set names to pretty strings' do
    employee = Employee.new({first_name: nil, last_name: nil, annual_income: nil, tax_paid: nil, tax_rate: nil})
    expect(employee.first_name).to eql("[First Name]")
    expect(employee.last_name).to eql("[Last Name]")
  end

  it 'does not mutate object inserted' do
    employee = {first_name: nil, last_name: nil, annual_income: nil, tax_paid: nil, tax_rate: nil}
    expect(Employee.new(employee).first_name).to eql("[First Name]")
    expect(employee[:first_name]).to eql(nil)
  end

  it 'can load employees' do
    employees = Employee.load
    expect(employees.length).to eql(5)
    expect(employees[0].class).to eql(Employee)
    expect(employees[0].first_name).to eql("Johnny")
  end
end


# expect(actual).to be_an_instance_of(expected)
# it "should calculate bracket score count" do
#   expect(GradeSummary.new().bracket_score_counts).to be_an_instance_of Hash
# end


