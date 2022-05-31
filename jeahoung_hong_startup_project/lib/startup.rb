require "employee"

class Startup

    attr_reader :name, :funding, :salaries, :employees
    def initialize(name, funding, salaries)
        @name = name
        @funding = funding
        @salaries = salaries
        @employees = []
    end

    def valid_title?(str)
        return @salaries.has_key?(str)
    end

    def >(startup)
        return @funding > startup.funding
    end

    def hire(name, title)
        unless valid_title?(title)
            raise ArgumentmentError.new "Not a valid title"
        end
        @employees << Employee.new(name, title)
    end

    def size
        return @employees.count
    end

    def pay_employee(employee)
        unless @funding > @salaries[employee.title]
            raise ArgumentmentError.new "Not enough money to pay employee"
        end
        employee.pay(@salaries[employee.title])
        @funding -= @salaries[employee.title]
    end

    def payday
        @employees.each do |el|
            pay_employee(el)
        end
    end

    def average_salary
        sum = 0
        @employees.each do |el|
            sum += @salaries[el.title]
        end
        return sum/(@employees.length * 1.0)
    end

    def close
        @employees = []
        @funding = 0
    end

    def acquire(startup)
        @funding += startup.funding
        startup.salaries.each do |k,v|
            if !@salaries.has_key?(k)
                @salaries[k] = v
            end
        end
        startup.employees.each do |el|
            @employees << el
        end
        startup.close
    end
end
