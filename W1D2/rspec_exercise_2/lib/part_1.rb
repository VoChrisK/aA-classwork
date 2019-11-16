def partition(arr,num)
    new_arr = Array.new(2) {Array.new()}
    arr.each do |ele|
        if ele < num
            new_arr[0] << ele
        else
            new_arr[1] << ele
        end
    end
    return new_arr
end

# this is too easy - please edit rspec to not use merge
def merge(hash1, hash2)
    hash1.merge(hash2)
end

def censor(sentence, arr)
    vowels = "aeiou"
    new_sentence = []
    sentence.split(" ").each do |word|
        if arr.include?(word.downcase)
            new_word = word.split("").map do |c|
                if vowels.include?(c.downcase)
                    "*"
                else   
                    c
                end
            end
            new_word = new_word.join("")
            new_sentence << new_word
        else
            new_sentence << word
        end
    end
    return new_sentence.join(" ")
end

def power_of_two?(num)
    while num % 2 == 0  #16
        num /= 2
    end

    if num == 1
        return true
    else
        return false
    end
end