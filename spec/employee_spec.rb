require 'spec'
require_relative '../lib/employee.rb'

#tests an Employee class to represent each employee in your dataset.
#tests must verify that you can instantiate your class when all expected data is present as well as handle the cases where some are missing.

describe Employee do

  it 'should have a first name' do
    expect(Student.new("Johnny", "Smith").first_name).to eql ("Johnny")
  end

  it 'should have a last name' do
    expect(Student.new("Johnny", "Smith")).to eql("Smith")
  end

end
