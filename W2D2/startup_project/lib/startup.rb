require "employee"

class Startup
    attr_reader :name, :funding, :salaries, :employees
    attr_writer :funding

   def initialize(name, funding, salaries)
    @name = name
    @funding = funding
    @salaries = salaries
    @employees = []
   end 

   def valid_title?(title)
    @salaries.has_key?(title)
   end

   def > (other_start_up)
    self.funding > other_start_up.funding
   end

   def hire(emp_name, emp_title)
    if !valid_title?(emp_title)
        raise
    else
        new_employee = Employee.new(emp_name, emp_title)
        @employees << new_employee
    end
   end

   def size
    @employees.length
   end

   def pay_employee(employee)
    salary = @salaries[employee.title]

    if @funding >= salary
        employee.pay(salary)
        @funding -= salary
    else
        raise
    end
   end

   def payday
    @employees.each{|emp| self.pay_employee(emp)}
   end

   def average_salary
    @employees.inject(0) do |total_salary, employee| 
        total_salary += @salaries[employee.title]
    end / @employees.length
   end

   def close
    @employees = []
    @funding = 0
   end

   def acquire(other_start_up)
    self.funding += other_start_up.funding
    other_start_up.salaries.each do |title, salary|
        self.salaries[title] = salary if !@salaries.has_key?(title)
    end
    other_start_up.employees.each { |employee| self.employees << employee }
    other_start_up.close
   end
end
