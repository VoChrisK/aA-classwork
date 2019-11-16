# Write a method, least_common_multiple, that takes in two numbers and returns the smallest number that is a mutiple
# of both of the given numbers
def least_common_multiple(num_1, num_2)
    i = 1
    while !(i % num_1 == 0 && i % num_2 == 0)
        i += 1
    end
    i
end


# Write a method, most_frequent_bigram, that takes in a string and returns the two adjacent letters that appear the
# most in the string.
def most_frequent_bigram(str)
    hash = Hash.new(0)
    (0...str.length-1).each do |i|
        hash[str[i..i+1]] += 1
    end
    
    max = 0
    hash.each do |k, v|
        max = v if v > max
    end

    new_hash = hash.select do |k, v|
        v == max
    end

    return new_hash.keys[0]
end


class Hash
    # Write a method, Hash#inverse, that returns a new hash where the key-value pairs are swapped
    def inverse
        new_hash = {}
        self.each do |k, v|
            new_hash[v] = k
        end
        new_hash
    end
end


class Array
    # Write a method, Array#pair_sum_count, that takes in a target number returns the number of pairs of elements that sum to the given target
    def pair_sum_count(num)
        new_arr = []
        self.each_with_index do |ele1, idx1|
            self.each_with_index do |ele2, idx2|
                if idx2 > idx1
                    new_arr << [ele1, ele2]
                end
            end
        end

        new_arr.count do |pair|
            pair.sum == num
        end
    end

    # Write a method, Array#bubble_sort, that takes in an optional proc argument.
    # When given a proc, the method should sort the array according to the proc.
    # When no proc is given, the method should sort the array in increasing order.
    #
    # Sorting algorithms like bubble_sort, commonly accept a block. That block accepts
    # two parameters, which represents the two elements in the array being compared.
    # If the block returns 1, it means that the second element passed to the block
    # should go before the first (i.e. switch the elements). If the block returns -1,
    # it means the first element passed to the block should go before the second
    # (i.e. do not switch them). If the block returns 0 it implies that
    # it does not matter which element goes first (i.e. do nothing).
    #
    # This should remind you of the spaceship operator! Convenient :)
    require "byebug"

    def bubble_sort(&prc)
        if prc.nil?
            prc = Proc.new{ |ele1, ele2| 1 if ele1 > ele2 }
        end
        sorted = false
        #debugger
        while !sorted
            sorted = true
            (0...self.length-1).each do |idx|
                if prc.call(self[idx], self[idx+1]) == 1
                    self[idx], self[idx+1] = self[idx+1], self[idx]
                    sorted = false
                end
            end
        end
        self
    end
end
