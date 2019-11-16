def element_count (arr)
    hash = Hash.new(0)

    arr.each { |element| hash[element] += 1 }

    hash

end

def char_replace!(str, hash)
    str.each_char.with_index do |char, i|
        if hash[char] != nil
            str[i] = hash[char]
        else
            str[i] = char
        end
    end
    str
end

def product_inject(numbers)

    numbers.inject { |accum, element| accum * element }

end