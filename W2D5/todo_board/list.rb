require_relative "item.rb"

class List
    attr_accessor :label
    def initialize(label)
        @label = label
        @items = []
    end

    def add_item(title, deadline, *description)
        return false if !Item.valid_date?(deadline)
        @items << Item.new(title,deadline,description)
        return true 
    end

    def size
        @items.length 
    end 

    def valid_index?(index)
        return false if (index < 0) || (index > @items.length - 1)
        true
    end 

    def swap(index_1, index_2)
        return false if !valid_index?(index_1) || !valid_index?(index_2)
        @items[index_1], @items[index_2] = @items[index_2], @items[index_1] 
        return true 
    end     

    def [](index)
        return nil if !valid_index?(index)
        return @items[index]
    end 
    
    def print_list
        puts "------------------------------------------------"
        puts "               #{label}"
        puts "------------------------------------------------"
        item = "Item".ljust(15) 
        deadline = "Deadline".ljust(15)
        puts "Index | #{item} | #{deadline} | Done?" 
        puts "------------------------------------------------"
        @items.each_with_index do |item, i|
            print "#{i.to_s.ljust(5)} | #{item.title.ljust(15)} | #{item.deadline.ljust(15)} | " 
            if item.done
                puts "Yes".ljust(2) 
            else 
                puts "No".ljust(3)
            end 
        end 
        
        puts "------------------------------------------------"
    end
    
    def print_full_item(index)
        if valid_index?(index)
            puts "------------------------------------------"
            item = @items[index].title.ljust(20)
            deadline = @items[index].deadline
            puts "#{item}  #{deadline}"
            if @items[index].done
                puts "Done? Yes"
            else 
                puts "Done? No"
            end 
            puts @items[index].description
            puts "------------------------------------------"
        end
    end

    def priority
        @items.sort_by {|item| item.deadline}[0]
    end

    def print_priority
        item = priority
        puts "------------------------------------------"
        puts "This is a priority item"
        title = item.title.ljust(31)
        deadline = item.deadline
        puts "#{title} #{deadline}"
        if item.done
            puts "Done? Yes"
        else 
            puts "Done? No"
        end 
        puts item.description
        puts "------------------------------------------"
    end

    def up(idx, amt=1)
        return false if !valid_index?(idx)
        amt.times do 
            @items[idx],@items[idx-1] = @items[idx-1], @items[idx] if idx > 0 
            idx -= 1 
        end 
            
        true 
    end

    def down(idx, amt=1)
        return false if !valid_index?(idx)
        amt.times do 
            @items[idx],@items[idx+1] = @items[idx+1], @items[idx] if idx < size - 1 
            idx += 1 
        end 
            
        true 
    end
    
    def sort_by_date! 
        @items.sort_by! {|item| item.deadline}

    end

    def toggle_item(index)
        return false if !valid_index?(index)
        @items[index].toggle
        true
    end

    def remove_item(index)
        @items.delete_at(index)
    end

    def purge
        i = 0 
        while i < @items.length 
            if @items[i].done 
                remove_item(i) 
                i -= 1 
            end 
            i += 1
        end 
    end
end

# list = List.new("a label")
# list.add_item("title", "2019-02-03", "a description")
# list.add_item("another title", "2019-11-12", "another description")
# list.add_item("another title", "2018-03-12", "another description")
# list.add_item("another titledd", "2018-03-11", "another description")
# # list.print_priority
# list.print_list
# # list.print_full_item(1)
# list.remove_item(1)
# list.print_list