def is_prime?(num)
    (2...num).each {|factor| return false if num % factor == 0 } && num > 1
end


def nth_prime(n)
    counter = 0

    i = 2
    while  counter < n 
        if is_prime?(i)
            counter += 1
        end

        i += 1
    end

    i - 1
end

def prime_range(min, max)
    prime_array = []
    (min..max).each { |num| prime_array << num if is_prime?(num) }
    prime_array
end


# p nth_prime(1)
# p nth_prime(2)
# p nth_prime(3)
# p nth_prime(4)
# p nth_prime(300)