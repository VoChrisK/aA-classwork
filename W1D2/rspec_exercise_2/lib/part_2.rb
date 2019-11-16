def palindrome?(str)
    i = 0
    j = str.length-1
    while i<j
        return false if str[i] != str[j]
        i+=1
        j-=1
    end
    return true
end

def substrings(str)
    new_arr = []
    str.split("").each.with_index do |c1, i|
        j = i
        while j < str.length
            new_arr << str[i..j]
            j += 1
        end
    end
    new_arr
end

def palindrome_substrings(str)
    substr = substrings(str)
    substr.select do |sub|
        palindrome?(sub) && sub.length > 1
    end
end