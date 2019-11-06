require_relative "employee.rb"

class Manager < Employee
  attr_accessor :employees

  def initialize(title, salary, boss, employees)
    super(title, salary, boss)
    @employees = employees
  end

  def bonus(multiplier)
    bonus = @employees.map { |emp| emp.salary }.sum * multiplier
  end
end

ned = Manager.new("Founder", 1000000, nil, [])
darren = Manager.new("TA Manager", 78000, ned, [])
david = Employee.new("TA", 10000, darren)
shawna = Employee.new("TA", 12000, darren)
ned.employees = [darren, david, shawna]
darren.employees = [david, shawna]

p ned.bonus(5) # => 500_000
p darren.bonus(4) # => 88_000
p david.bonus(3) # => 30_000