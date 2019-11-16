class Array
    def my_each(&prc)
        i = 0

        while i < self.length
            prc.call(self[i])
            i += 1
        end

        self 
    end

    def my_select(&prc)
        arr = self.my_each(&prc)
        new_arr = []
        i = 0

        while i < self.length
            new_arr << self[i] if prc.call(self[i])
            i += 1
        end

        new_arr
    end

    def my_reject(&prc)
        arr = self.my_each(&prc)
        new_arr = []
        i = 0

        while i < self.length
            new_arr << self[i] if !prc.call(self[i])
            i += 1
        end

        new_arr
    end

    def my_any?(&prc)
        arr = self.my_each(&prc)
        i = 0

        while i < self.length
            return true if prc.call(self[i])
            i += 1
        end
        false 
    end

    def my_all?(&prc)
        arr = self.my_each(&prc)
        i = 0

        while i < self.length
            return false if !prc.call(self[i])
            i += 1
        end
        true
    end

    def my_flatten
        self.flatten(self)
    end

    # require "byebug"

    # [1, 2, 3, [4, [5, 6]], [[[7]], 8]]
    def flatten(arr)
        # debugger
        # return [arr] if !arr.kind_of? Array

        # new_arr = [] # flatten(1) -> arr = 1

        # arr.each do |ele|
        #     new_arr << flatten(ele)
        # end

        # return new_arr

        return [arr] if !arr.kind_of? Array #flatten(1) => [1]

        new_arr = []
        #new_arr_2 = [4, 5 ,6]
        #[5, 6]

        arr.each do |ele|
            new_arr += flatten(ele)
        end

        return new_arr
    end

    def my_zip(*args)
        args.unshift(self)
        new_arr = Array.new(self.length) {Array.new(args.length)}
        new_arr.each_with_index do |row, idx1|
            row.each_with_index do |col, idx2|
                new_arr[idx1][idx2] = args[idx2][idx1] if !args[idx2][idx1].nil?
            end
        end
        new_arr
    end

    # [a,b,c,d] => [b,c,d,a]
    def my_rotate(n=1)
        new_arr = self.map{|ele| ele}
        if n > 0
            n.times do
                ele = new_arr.shift
                new_arr.push(ele)
            end
        else
            n.abs.times do
                ele = new_arr.pop
                new_arr.unshift(ele)
            end
        end
        new_arr
    end  
    
    def my_join(delimiter = "")
        new_str = ""

        self.each do |ele|
            new_str += ele + delimiter
        end

        new_str.chomp(delimiter)
    end

    def my_reverse
        new_arr = []

        self.each do |ele|
            new_arr.unshift(ele)
        end

        new_arr
    end
end

# self = [1,2,3]
# a = [4,5,6]
# b = [7,8,9]

# [[1,2,3], 
 # [4,5,6], 
 # [7,8,9]]



#  # calls my_each twice on the array, printing all the numbers twice.
# return_value = [1, 2, 3].my_each do |num|
#   puts num
# end.my_each do |num|
#   puts num
# end
# # => 1
#     #  2
#     #  3
#     #  1
#     #  2
#     #  3

# p return_value  # => [1, 2, 3]

# a = [1, 2, 3]
# p a.my_select { |num| num > 1 } # => [2, 3]
# p a.my_select { |num| num == 4 } # => []

# a = [1, 2, 3]
# p a.my_reject { |num| num > 1 } # => [1]
# p a.my_reject { |num| num == 4 } # => [1, 2, 3]

# a = [1, 2, 3]
# p a.my_any? { |num| num > 1 } # => true
# p a.my_any? { |num| num == 4 } # => false
# p a.my_all? { |num| num > 1 } # => false
# p a.my_all? { |num| num < 4 } # => true

# p [1, 2, 3, [4, [5, 6]], [[[7]], 8]].my_flatten # => [1, 2, 3, 4, 5, 6, 7, 8]

# a = [ 4, 5, 6 ]
# b = [ 7, 8, 9 ]
# p [1, 2, 3].my_zip(a, b) # => [[1, 4, 7], [2, 5, 8], [3, 6, 9]]
# p a.my_zip([1,2], [8])   # => [[4, 1, 8], [5, 2, nil], [6, nil, nil]]
# p [1, 2].my_zip(a, b)    # => [[1, 4, 7], [2, 5, 8]]

# c = [10, 11, 12]
# d = [13, 14, 15]
# p [1, 2].my_zip(a, b, c, d)    # => [[1, 4, 7, 10, 13], [2, 5, 8, 11, 14]]

# a = [ "a", "b", "c", "d" ]
# p a.my_rotate         #=> ["b", "c", "d", "a"]
# p a.my_rotate(2)      #=> ["c", "d", "a", "b"]
# p a.my_rotate(-3)     #=> ["b", "c", "d", "a"]
# p a.my_rotate(15)     #=> ["d", "a", "b", "c"]

# a = [ "a", "b", "c", "d" ]
# p a.my_join         # => "abcd"
# p a.my_join("$")    # => "a$b$c$d"

p [ "a", "b", "c" ].my_reverse   #=> ["c", "b", "a"]
p [ 1 ].my_reverse               #=> [1]