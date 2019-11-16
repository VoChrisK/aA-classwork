require "byebug"

def strange_sums(arr) #try using Array#count next time
    
    # counter = 0
    # i = 0

    # while i < arr.length
    #     j = i + 1
    #     while j < arr.length
    #         counter += 1 if arr[i] + arr[j] == 0
    #         j += 1
    #     end
    #     i += 1
    # end

    # i = 0
    # arr.count do |ele1|
    #      arr.any? { |ele2| ele1 + ele2 == 0 }
    # end

    # counter
end

# p strange_sums([2, -3, 3, 4, -2])     # 2
# p strange_sums([42, 3, -1, -42])      # 1
# p strange_sums([-5, 5])               # 1
# p strange_sums([19, 6, -3, -20])      # 0
# p strange_sums([9])                   # 0

def pair_product(numbers, product)
    (0...numbers.length).each do |i|
        (i+1...numbers.length).each do |j|
            return true if numbers[i] * numbers[j] == product
        end
    end
    false
end

# p pair_product([4, 2, 5, 8], 16)    # true
# p pair_product([8, 1, 9, 3], 8)     # true
# p pair_product([3, 4], 12)          # true
# p pair_product([3, 4, 6, 2, 5], 12) # true
# p pair_product([4, 2, 5, 7], 16)    # false
# p pair_product([8, 4, 9, 3], 8)     # false
# p pair_product([3], 12)             # false

def rampant_repeats(str, hash)
    new_str = ""
    str.each_char do |char|
        if hash.has_key?(char)
            hash[char].times { new_str += char }
        else
            new_str += char
        end
    end
    new_str
end

# p rampant_repeats('taco', {'a'=>3, 'c'=>2})             # 'taaacco'
# p rampant_repeats('feverish', {'e'=>2, 'f'=>4, 's'=>3}) # 'ffffeeveerisssh'
# p rampant_repeats('misispi', {'s'=>2, 'p'=>2})          # 'mississppi'
# p rampant_repeats('faarm', {'e'=>3, 'a'=>2})            # 'faaaarm'

def perfect_square(number)
    i = 1
    while i * i <= number
        return true if i * i == number
        i += 1
    end
    false
end

# p perfect_square(1)     # true
# p perfect_square(4)     # true
# p perfect_square(64)    # true
# p perfect_square(100)   # true
# p perfect_square(169)   # true
# p perfect_square(2)     # false
# p perfect_square(40)    # false
# p perfect_square(32)    # false
# p perfect_square(50)    # false

# Phase 2

#24 -> 1,2,3,4,6,8,12,24

def anti_prime?(num)
    counter = count_divisors(num)
    counters = []
    
    (1...num).each do |i|
        if i.even? #unnecessary to add .even
            counters << count_divisors(i)
        end
    end
    counters.each do |c| 
        if c > counter
            return false
        end
    end
    true
end

def count_divisors(num) #can be simplified using count 
    counter = 0
    (1..num / 2).each do |i|
        if num % i == 0
            counter += 1
        end
    end
    counter
end

# p anti_prime?(24)   # true
# p anti_prime?(36)   # true
# p anti_prime?(48)   # true
# p anti_prime?(360)  # true
# p anti_prime?(1260) # true
# p anti_prime?(27)   # false
# p anti_prime?(5)    # false
# p anti_prime?(100)  # false
# p anti_prime?(136)  # false
# p anti_prime?(1024) # false

# def matrix_addition(matrix1, matrix2)
#     new_matrix = Array.new(matrix1.length) { Array.new(matrix1[0].length) }

#     (0...matrix1.length).each do |i|
#         (0...matrix1[i].length).each do |j|
#             new_matrix[i][j] = matrix1[i][j] + matrix2[i][j]
#         end
#     end

#     new_matrix
# end

# matrix_a = [[2,5], [4,7]]
# matrix_b = [[9,1], [3,0]]
# matrix_c = [[-1,0], [0,-1]]
# matrix_d = [[2, -5], [7, 10], [0, 1]]
# matrix_e = [[0 , 0], [12, 4], [6,  3]]

# p matrix_addition(matrix_a, matrix_b) # [[11, 6], [7, 7]]
# p matrix_addition(matrix_a, matrix_c) # [[1, 5], [4, 6]]
# p matrix_addition(matrix_b, matrix_c) # [[8, 1], [3, -1]]
# p matrix_addition(matrix_d, matrix_e) # [[2, -5], [19, 14], [6, 4]]

def mutual_factors(*numbers)
    mut_facts = []
    hash = Hash.new(0)

    numbers.each do |number|
        (1..number).each { |i| hash[i] += 1 if is_divisor?(number, i) }
    end

    hash.each do |k, v|
        if hash[k] == numbers.length
            mut_facts << k
        end
    end
    mut_facts
end

# def is_divisor?(num)    
#     (1..num / 2).each do |i|
#         if num % i == 0
#             return true
#         end
#     end
#     false
# end

def is_divisor?(number, i)    
    number % i == 0
end

# p mutual_factors(50, 30)            # [1, 2, 5, 10]
# p mutual_factors(50, 30, 45, 105)   # [1, 5]
# p mutual_factors(8, 4)              # [1, 2, 4]
# p mutual_factors(8, 4, 10)          # [1, 2]
# p mutual_factors(12, 24)            # [1, 2, 3, 4, 6, 12]
# p mutual_factors(12, 24, 64)        # [1, 2, 4]
# p mutual_factors(22, 44)            # [1, 2, 11, 22]
# p mutual_factors(22, 44, 11)        # [1, 11]
# p mutual_factors(7)                 # [1, 7]
# p mutual_factors(7, 9)              # [1]

def tribonacci_number(num)
    return 1 if num == 1
    return 1 if num == 2
    return 2 if num == 3

    base = [1,1,2]

    while base.length < num
        base << base[-3..-1].sum
    end

    # base[-3..-1].sum
    base[-1]
end 

# p tribonacci_number(1)  # 1
# p tribonacci_number(2)  # 1
# p tribonacci_number(3)  # 2
# p tribonacci_number(4)  # 4
# p tribonacci_number(5)  # 7
# p tribonacci_number(6)  # 13
# p tribonacci_number(7)  # 24
# p tribonacci_number(11) # 274

def matrix_addition(matrix1, matrix2)
    new_matrix = Array.new(matrix1.length) { Array.new(matrix1[0].length) }

    (0...matrix1.length).each do |i|
        (0...matrix1[i].length).each do |j|
            new_matrix[i][j] = matrix1[i][j] + matrix2[i][j]
        end
    end

    new_matrix
end

def matrix_addition_reloaded(*matrices)
    # results = matrices[0] # Array.new(matrices[0].length) { Array.new(matrices[0][0].length) }
    # i = 1

    # while i < matrices.length 
    #     results = matrix_addition(results, matrices[i])
    #     i += 1
    # end
    # results

    column = matrices[0].length 
    row = matrices[0][0].length

    if matrices.all? { |matrix| matrix.length == column && matrix[0].length == row }
        return matrices.inject { |acc, el| matrix_addition(acc, el) }
    else
        return nil
    end  
end

# matrix_a = [[2,5], [4,7]]
# matrix_b = [[9,1], [3,0]]
# matrix_c = [[-1,0], [0,-1]]
# matrix_d = [[2, -5], [7, 10], [0, 1]]
# matrix_e = [[0 , 0], [12, 4], [6,  3]]

# p matrix_addition_reloaded(matrix_a, matrix_b)              # [[11, 6], [7, 7]]
# p matrix_addition_reloaded(matrix_a, matrix_b, matrix_c)    # [[10, 6], [7, 6]]
# p matrix_addition_reloaded(matrix_e)                        # [[0, 0], [12, 4], [6, 3]]
# p matrix_addition_reloaded(matrix_d, matrix_e)              # [[2, -5], [19, 14], [6, 4]]
# p matrix_addition_reloaded(matrix_a, matrix_b, matrix_e)    # nil
# p matrix_addition_reloaded(matrix_d, matrix_e, matrix_c)    # nil

# def row_check(arr)
#     (0..arr.length-1).each do |i|
#         row_counter = 1
#         col_counter = 1

#         (0...arr.length-1).each do |j|
#             row_counter += 1 if arr[i][j] == arr[i][j + 1]
#             col_counter += 1 if arr[j][i] == arr[j + 1][i]
        
#         end

#         if row_counter == arr.length || col_counter == arr.length
#             return true
#         end
        
#     end
#     false
# end

# def col_check(arr)
#     (0..arr.length-1).each do |i|
#         col_counter = 1

#         (0...arr.length-1).each do |j|
#             col_counter += 1 if arr[j][i] == arr[j + 1][i]
    
#         end

#         if col_counter == arr.length 
#             return true
#         end
        
#     end
#     false
# end
    

def squarocol?(arr)
    (0..arr.length-1).each do |i|
        row_counter = 1
        col_counter = 1

        (0...arr.length-1).each do |j|
            row_counter += 1 if arr[i][j] == arr[i][j + 1]
            col_counter += 1 if arr[j][i] == arr[j + 1][i]
        
        end

        if row_counter == arr.length || col_counter == arr.length
            return true
        end
        
    end
    false
end


# p squarocol?([
#     [:a, :x , :d],
#     [:b, :x , :e],
#     [:c, :x , :f],
# ]) # true

# p squarocol?([
#     [:x, :y, :x],
#     [:x, :z, :x],
#     [:o, :o, :o],
# ]) # true

# p squarocol?([
#     [:o, :x , :o],
#     [:x, :o , :x],
#     [:o, :x , :o],
# ]) # false

# p squarocol?([
#     [1, 2, 2, 7],
#     [1, 6, 6, 7],
#     [0, 5, 2, 7],
#     [4, 2, 9, 7],
# ]) # true

# p squarocol?([
#     [1, 2, 2, 7],
#     [1, 6, 6, 0],
#     [0, 5, 2, 7],
#     [4, 2, 9, 7],
# ]) # false

def squaragonal?(array)
    diag_right = 1
    diag_left = 1

    (0...array.length - 1).each do |i|
        (0...array.length - 1).each do |j|
            diag_right += 1 if array[i][j] == array[i + 1][j + 1]
            # diag_left += 1 if array[array.length - i - 1][j] == array[array.length - i - 2][j + 1]
            diag_left += 1 if array[-(i + 1)][j] == array[-(i + 2)][j + 1]
        end
    end
    if diag_right == array.length || diag_left == array.length
        return true
    else
        return false
    end
end


# p squaragonal?([
#     [:x, :y, :o],
#     [:x, :x, :x],
#     [:o, :o, :x],
# ]) # true

# p squaragonal?([
#     [:x, :y, :o],
#     [:x, :o, :x],
#     [:o, :o, :x],
# ]) # true

# p squaragonal?([
#     [1, 2, 2, 7],
#     [1, 1, 6, 7],
#     [0, 5, 1, 7],
#     [4, 2, 9, 1],
# ]) # true

# p squaragonal?([
#     [1, 2, 2, 5],
#     [1, 6, 5, 0],
#     [0, 2, 2, 7],
#     [5, 2, 9, 7],
# ]) # false

def pascals_triangle(n)
    triangles = [[1]]
    while triangles.length < n
        triangles << next_line(triangles[-1])
    end
    triangles
end

def next_line(prev)
    base = [1]
    i = 0
    while i < prev.length - 1
        base << prev[i] + prev[i+1]
        i += 1
    end
    base << 1
    base
end

# p pascals_triangle(5)
# # [
# #     [1],
# #     [1, 1],
# #     [1, 2, 1],
# #     [1, 3, 3, 1],
# #     [1, 4, 6, 4, 1]
# # ]

# p pascals_triangle(7)
# # [
# #     [1],
# #     [1, 1],
# #     [1, 2, 1],
# #     [1, 3, 3, 1],
# #     [1, 4, 6, 4, 1],
# #     [1, 5, 10, 10, 5, 1],
# #     [1, 6, 15, 20, 15, 6, 1]
# # ]

# Phase 4

def is_prime?(n)
    (2...n).each { |factor| return false if n % factor == 0 } 
    n > 1
end

def mersenne_prime(num)
    i = 1
    mersenne = Proc.new { |n| (2 ** n) - 1 }    
    counter = 0
    result = 0
    # debugger
    while counter < num
        i += 1
        if is_prime?(mersenne.call(i))
            counter += 1
            result = mersenne.call(i)
        end
    end

    # result
    mersenne.call(i)
end

# p mersenne_prime(1) # 3
# p mersenne_prime(2) # 7
# p mersenne_prime(3) # 31
# p mersenne_prime(4) # 127
# p mersenne_prime(6) # 131071

def triangular_word?(word)
    alphabet = "abcdefghijklmnopqrstuvwxyz"

    sum = 0
    word.each_char do |char|
        sum += alphabet.index(char) + 1
    end

    i = 1
    while (i * (i + 1)) / 2 <= sum
        return true if (i * (i + 1)) / 2 == sum
        i += 1
    end
    
    false
end

# p triangular_word?('abc')       # true
# p triangular_word?('ba')        # true
# p triangular_word?('lovely')    # true
# p triangular_word?('question')  # true
# p triangular_word?('aa')        # false
# p triangular_word?('cd')        # false
# p triangular_word?('cat')       # false
# p triangular_word?('sink')      # false

def consecutive_collapse(numbers)
    i = 0
    while i < numbers.length - 1
        if (numbers[i] - numbers[i + 1]).abs == 1
            numbers = numbers[0...i] + numbers[(i + 2)..-1]
            i = 0
        else
            i += 1
        end
    end
    numbers
end

# p consecutive_collapse([3, 4, 1])                     # [1]
# p consecutive_collapse([1, 4, 3, 7])                  # [1, 7]
# p consecutive_collapse([9, 8, 2])                     # [2]
# p consecutive_collapse([9, 8, 4, 5, 6])               # [6]
# p consecutive_collapse([1, 9, 8, 6, 4, 5, 7, 9, 2])   # [1, 9, 2]
# p consecutive_collapse([3, 5, 6, 2, 1])               # [1]
# p consecutive_collapse([5, 7, 9, 9])                  # [5, 7, 9, 9]
# p consecutive_collapse([13, 11, 12, 12])              # []

#helper
def pos_nth_prime(ele, n)
    i = ele 
    counter = 0

    while counter < n
        i += 1
        if is_prime?(i)
            counter += 1
        end
        # if counter == n
        #     return i
        # end
    end

    return i
end

def neg_nth_prime(ele, n)
    i = ele 
    counter = 0

    while counter < n.abs
        i -= 1
        return nil if i < 2
        
        if is_prime?(i)
            counter += 1
        end
    end

    return i
end



def pretentious_primes(arr, n)
    new_arr = []

    arr.each do |ele|
        if n > 0
            new_arr << pos_nth_prime(ele, n)
        else
            new_arr << neg_nth_prime(ele, n)
        end
    end

    new_arr
end

p pretentious_primes([4, 15, 7], 1)           # [5, 17, 11]
p pretentious_primes([4, 15, 7], 2)           # [7, 19, 13]
p pretentious_primes([12, 11, 14, 15, 7], 1)  # [13, 13, 17, 17, 11]
p pretentious_primes([12, 11, 14, 15, 7], 3)  # [19, 19, 23, 23, 17]
p pretentious_primes([4, 15, 7], -1)          # [3, 13, 5]
p pretentious_primes([4, 15, 7], -2)          # [2, 11, 3]
p pretentious_primes([2, 11, 21], -1)         # [nil, 7, 19]
p pretentious_primes([32, 5, 11], -3)         # [23, nil, 3]
p pretentious_primes([32, 5, 11], -4)         # [19, nil, 2]
p pretentious_primes([32, 5, 11], -5)         # [17, nil, nil]