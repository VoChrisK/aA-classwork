def select_even_nums(arr)
    arr.select do |num|
        num.even?
    end
end

def reject_puppies(puppies)
    puppies.reject {|puppy| puppy["age"] <= 2}
end

def count_positive_subarrays(arr)
    arr.count { |sub_arr| sub_arr.sum > 0 }
end

def aba_translate(word)
    vowels = "aeiou"
    new_word = ""
    word.each_char do |c| 
        if vowels.include?(c)
            new_word += c + "b" + c
        else
            new_word += c
        end
    end
    return new_word
end

def aba_array(words)
    words.map do |word|
        aba_translate(word)
    end
end