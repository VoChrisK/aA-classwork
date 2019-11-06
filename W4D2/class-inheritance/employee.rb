class Employee
  attr_reader :title, :salary, :boss

  def initialize(title, salary, boss)
    @title = title
    @salary = salary
    @boss = boss
  end

  def bonus(multiplier)
    bonus = salary * multiplier
  end
end