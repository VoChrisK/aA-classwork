def proper_factors(num)
    factors = []
    (1...num).each { |factor| factors << factor if num % factor == 0 }
    factors
end

def aliquot_sum(num)
    proper_factors(num).sum
end

def perfect_number?(num)
    num == aliquot_sum(num)
end

def ideal_numbers(n)
    arr = []
    num = 1

    while arr.length < n
        if perfect_number?(num)
            arr << num
        end
        num += 1
    end

    arr
end