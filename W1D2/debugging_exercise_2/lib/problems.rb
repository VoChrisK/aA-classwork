# Run `bundle exec rspec` and satisy the specs.
# You should implement your methods in this file.
# Feel free to use the debugger when you get stuck.

def largest_prime_factor(n)
    largest_prime = 0
    (2..n).each do |i|
        if prime?(i) && n % i == 0
            largest_prime = i
        end
    end
    largest_prime
end

def prime?(n)
    (2..n-1).each do |i|
        return false if n % i == 0
    end
    true
end

def unique_chars?(str) 
    hash = Hash.new(0)
    str.each_char do |c|
        if hash[c] == 1
            return false
        else
            hash[c] += 1
        end
    end 
    return true
end

def dupe_indices(arr)
    count = 0
    hash = {}
    another_arr = []
    arr.each.with_index do |el1, i|
        count = 0
        arr.each.with_index do |el2, j|
            if el1 == el2
                count += 1
                another_arr << j
            end
        end
        count -= 1
        if count >= 1 && !hash.has_key?(el1)
            hash[el1] = another_arr
        end
        another_arr = []
    end
    hash
end

def ana_array(arr1, arr2)
    hash = Hash.new(0)
    return false if arr1.length != arr2.length
    i = 0
    while i<arr1.length
        hash[arr1[i]] += 1
        hash[arr2[i]] += 1
        i += 1
    end
    hash.each_key do |k|
        return false if hash[k].odd?
    end
    return true
end