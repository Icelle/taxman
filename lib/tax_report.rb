require_relative './employee.rb'
require_relative './liability.rb'
require_relative './tax_calculator.rb'

class TaxReport

  def initialize(employee)
    @employee = employee
  end

  def print_tax_report
    employee.each do |k, v|
      if amount_due < 0
        "#{employee.first_name} #{employee.last_name} will receive a refund of #{employee.liability.amount_owed}"
      else
        "#{(employee.first_name)} #{employee.last_name} has tax liability of #{employee.liability.amount_owed}"
      end
    end
    tax_report
  end
end

