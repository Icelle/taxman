#Liability must expose three properties: employee, amount_due and amount_owed.
class Liability

  def initialize(employee)
    @employee = employee
  end

  def amount_due
   (@employee.tax_rate / 100.0) * @employee.annual_income
  end

  def amount_owed
    @employee.tax_paid - amount_due
  end
end
