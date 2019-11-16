def range(start, ending)
    return [] if start == ending

    return [start] + range(start + 1, ending)
end

# p range(1, 5)
# p range(2, 10)
# p range(0, 4)

def exponentiation(b, n)
    return 1 if n == 0

    return exponentiation(b, n - 1) * b
end

# p exponentiation(2, 4)
# p exponentiation(4, 4)
# p exponentiation(-5, 3)
# p exponentiation(3, 17)
# p exponentiation(-1, 14)

def exponentiation_2(b, n)
    return 1 if n == 0
    return b if n == 1

    if n.even?
        exponentiation_2(b, n / 2) ** 2
    else
        b * (exponentiation_2(b, (n - 1) / 2) ** 2)
    end
end

# p exponentiation_2(2, 4)
# p exponentiation_2(4, 4)
# p exponentiation_2(-5, 3)
# p exponentiation_2(3, 17)
# p exponentiation_2(-1, 14)
# p exponentiation_2(-1, 256)

class Array
    def deep_dup
        dupe_array = self.map do |el|
            if el.is_a?(Array)
                el.deep_dup
            else
                el
            end
        end

        dupe_array.dup
    end
end

def fibonacci(n)
    return [] if n == 0
    return [1] if n == 1
    return [1,1] if n == 2
    arr = fibonacci(n - 1)

    arr << arr[-1] + arr[-2] 
end

# p fibonacci(10)
# p fibonacci(3)
# p fibonacci(5)
# p fibonacci(18)

def fibonacci_iterative(n)
    arr = [1,1]
    return arr.take(n) if n <= 2
    (3..n).each do |el|
        arr << arr[-1] + arr[-2]
    end
    arr[-1]
end

# p fibonacci_iterative(1)
# p fibonacci_iterative(10)
# p fibonacci_iterative(3)
# p fibonacci_iterative(5)
# p fibonacci_iterative(18)

def binary_search(arr, target)
    return nil if !arr.include?(target)
    middle_ele = arr[arr.length / 2]
    middle_idx = arr.length / 2
    if target == middle_ele
        return middle_idx
    elsif target > middle_ele
        binary_search(arr[middle_idx+1..-1], target) + arr[0..middle_idx].length
    else
        binary_search(arr[0...middle_idx], target)
    end
end

# binary_search([1, 3, 4, 5, 9])
# binary_search([5, 9])
# binary_search([5])

# p binary_search([1, 2, 3], 1) # => 0
# p binary_search([2, 3, 4, 5], 3) # => 1
# p binary_search([2, 4, 6, 8, 10], 6) # => 2
# p binary_search([1, 3, 4, 5, 9], 5) # => 3
# p binary_search([1, 2, 3, 4, 5, 6], 6) # => 5
# p binary_search([1, 2, 3, 4, 5, 6], 0) # => nil
# p binary_search([1, 2, 3, 4, 5, 7], 6) # => nil
# p binary_search([1, 2, 3, 4, 5, 7], 3) # => 2

# [3,2,1,4,7,5,8,6]
#[3,2,1,4] [7,5,8,6]
#[3,2] [1,4] [7,5] [8,6]
#[3] [2] [1] [4] [7] [5] [8] [6]
# [2,3] [1,4] [5,7] [6,8]
#[1,2,3,4] [5,6,7,8]

def merge_sort(array)
    return array if array.length <= 1
    middle = array.length / 2
    merge(merge_sort(array[0...middle]), merge_sort(array[middle..-1]))
end

#[2,3] [1,4]
def merge(array_1, array_2)
    new_array = []
    until array_1.empty? || array_2.empty?
        if array_1[0] > array_2[0]
            new_array << array_2.shift
        else
            new_array << array_1.shift
        end
    end

    if array_1.empty? 
        new_array.concat(array_2)
    else
        new_array.concat(array_1)
    end
    new_array
end

# arr = (1..100).to_a.shuffle
# p arr
# p merge_sort(arr)

require "byebug"

#[1,2,3]
def subsets(array)
    # debugger
    return [[], array] if array.length == 1
    # first = [array[0]] #[1]
    # second = subsets(array[1..-1]) # subsets([2,3])
    # arr = []
    # arr << first
    # arr << second
    # arr << first.concat(second)
    # arr
    sub_sets = subsets(array[0..-2])
    other_subsets = sub_sets.map do |set|
        set + [array[-1]]
    end
    sub_sets + other_subsets
end

# sub_sets = [[1], [1,2], [], [2]]
# array[-1] = 3


    # subsets([1,2])
    #   subsets([1]) => [[1], []]
    # sub_sets = [[1], [1,2], 2]
    # other_subsets = [1,2]

# p subsets([1,2,3])

# subsets([]) # => [[]]
# subsets([1]) # => [[], [1]]
# subsets([1, 2]) # => [[], [1], [2], [1, 2]]
# subsets([1, 2, 3])
# # => [[], [1], [2], [1, 2], [3], [1, 3], [2, 3], [1, 2, 3]]

# [[1]] [2]
# [[1], [1,2],[2]] [3]



# subsets([2,3])
#  first = [2]
#   second = subsets([3]) => [3]
#    return [3]
#
#
def permutations(array)
    # debugger
    return [array] if array.length == 1
    perms = permutations(array[0..-2])
    other_perms = []
    perms.each do |perm|
        other_perms += (0..perm.length).map do |idx|
            temp = perm.dup
            temp.insert(idx, array[-1])
        end
    end 
    other_perms
end
# [[1]] [2]
# [[2,1], [1,2]] [3]
# [3,2,1], [2,3,1], [2,1,3] | [3,1,2], [1,3,2], [1,2,3]
#
#

# p permutations([1,2,3,4,5]).count {|el| el} == 120

# def permutations_alt(array)

# end

# greed(14)
# greed(4)
# greed(3)
# ...

def greedy_make_change(change, coins)
    coins.each do |coin|
        if change > coin
            return [coin] + greedy_make_change(change-coin, coins)
        elsif coin == change
            return [coin]
        end
    end
end
# p greedy_make_change(24, [10,7,1])
# p greedy_make_change(28, [10,7,1])
# p greedy_make_change(28, [10,3,1])

# greedy_make_change(24-10) -> # greedy_make_change(14-10) # greedy_make_change(14-7) # greedy_make_change(14-1)
# greedy_make_change(24-7)
# greedy_make_change(24-1)
require "byebug"

def make_better_change(change, coins)
    debugger
    total_combinations = []
    coins.each do |coin|
        if change > coin
            total_combinations << [coin] + make_better_change(change-coin, coins)
        elsif coin == change
            [coin]
        end
    end
    total_combinations
end 

total_combinations = []
p make_better_change(24, [10,7,1])

