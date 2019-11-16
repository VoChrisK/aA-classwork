require "byebug"
require_relative "list.rb"

class TodoBoard 
    def initialize(label) 
        @list = Hash.new {|h, k | h[k] = List.new(k) }
    end 

    def get_command 
        print "\nEnter a command: "
        cmd, *args = gets.chomp.split(' ')
        # mktodo <title> <deadline> <optional description>
        # cmd = mktodo
        # *args = [<title>, <deadline>, <optional>, description>]
        # mktodo "Great" "2019-03-04" "a description"
        # cmd = mktodo
        # *args = ["Great", "2019-03-04", "a description"]

        case cmd
        when "mklist"
            @list[*args]
        when "ls"
            puts "Labels:"
            @list.each_key {|k| puts k}
        when "showall"
            @list.each { |k, v| v.print_list }
        when 'mktodo'
            @list[args[0]].add_item(*args[1..-1])
        when 'up'
            @list[args[0]].up(*args[1..-1].map(&:to_i))
        when 'down'
             @list[args[0]].down(*args[1..-1].map(&:to_i))
        when 'swap'
            @list[args[0]].swap(*args[1..-1].map(&:to_i))
        when 'sort'
            @list[args[0]].sort_by_date!
        when 'priority'
            @list[args[0]].print_priority
        when 'print'
           if args[1].nil?
            @list[args[0]].print_list
           else 
            @list[args[0]].print_full_item(args[1].to_i)
           end
        when 'toggle'
            @list[args[0]].toggle_item(args[1].to_i)
        when 'rm'
            @list[args[0]].remove_item(args[1].to_i)
        when 'purge'
            @list[args[0]].purge
        when 'quit'
            return false
        else
            print "Sorry, that command is not recognized."
        end

        true
    end

    def run 
        until !get_command
        end
    end 
end

my_board = TodoBoard.new('cool-tech-to-learn')
my_board.run