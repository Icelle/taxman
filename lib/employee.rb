require 'csv'
# require 'pry'

class Employee
  attr_reader :first_name, :last_name, :annual_income, :tax_paid, :tax_rate, :liability

  def initialize(employee)
    employee       = sanitize(employee.dup)
    @first_name    = employee[:first_name]
    @last_name     = employee[:last_name]
    @annual_income = employee[:annual_income]
    @tax_paid      = employee[:tax_paid]
    @tax_rate      = employee[:tax_rate]
    @liability     = Liability.new(self)
  end

  def self.load(filename = './assets/tax_data.csv')
    tax_data = []
    csv_table = CSV.table(filename).to_a
    header = csv_table[0]
    csv_table.delete_at(0)
    csv_table.each do |row|
      tax_data << Employee.new(Hash[header.zip(row)])
    end
    tax_data
  end

  def sanitize(employee)
    employee.each do |k, v|
      if v.nil?
        if (k == :first_name || k == :last_name)
          employee[k] = symbol_to_readable_string(k)
        else
          employee[k] = 0
        end
      end
    end
    return employee
  end

  def symbol_to_readable_string(symbol)
    return symbol.to_s.split("_").map(&:capitalize).join(" ").insert(0,"[").concat(']')
  end
end

# {
#   Smith => [annual income, tax_paid, tax_rate],
#   Doe => [annual income, tax_paid, tax_rate],
#   Lemon => [annual income, tax_paid, tax_rate],
#   Orsillio => [annual income, tax_paid, tax_rate],
#   Schmidt => [annual income, tax_paid, tax_rate]
# }



