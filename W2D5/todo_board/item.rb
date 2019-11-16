class Item
    attr_reader :title, :deadline, :description, :done
    attr_writer :title, :description

    def self.valid_date?(date_string)
        format = ["YYYY", "MM","DD"]
        date_string = date_string.split("-")
        format.each_with_index do |date, i|
            if date.length != date_string[i].length
                return false 
            end 
        end 

        (date_string[1].to_i > 0 && date_string[1].to_i < 13) && (date_string[2].to_i > 0 && date_string[2].to_i < 32)

    end 

    def initialize(title, deadline, description="")
        @title = title
        if Item.valid_date?(deadline)
            @deadline = deadline
        else
            raise "Invalid format"
        end
        @description = description
        @done = false
    end

    def deadline=(new_deadline)
        if Item.valid_date?(new_deadline)
            @deadline = new_deadline
        else
            raise "Invalid format"
        end
    end

    def toggle
        if @done
            @done = false 
        else
            @done = true 
        end
    end
    
end

# p Item.valid_date?('2019-10-25') # true
# p Item.valid_date?('1912-06-23') # true
# p Item.valid_date?('2018-13-20') # false
# p Item.valid_date?('2018-12-32') # false
# p Item.valid_date?('10-25-2019') # false

# p Item.new('Fix login page', '2019-10-25', 'The page loads too slow.')

# p Item.new(
#     'Buy Cheese',
#     '2019-10-21',
#     'We require American, Swiss, Feta, and Mozzarella cheese for the Happy hour!'
# )

# p Item.new(
#     'Fix checkout page',
#     '10-25-2019',
#     'The font is too small.'
# ) # raises error due to invalid date

# item = Item.new("title", "2019-02-03", "a description")

# p item.title = "new_title"