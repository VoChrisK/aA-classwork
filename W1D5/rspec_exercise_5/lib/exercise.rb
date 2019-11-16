require "byebug"

# def zip(*arr)
#     # debugger
#     new_arr = Array.new(arr[0].length){Array.new(0)}
#     arr.each do |el|
#         el.each_with_index do |e, i|
#            new_arr[i] << e
#         end
#     end
#     new_arr
# end

def zip(*arr)
    arr.transpose
end

def prizz_proc(arr, prc1, prc2)
    arr.select do |ele|
        (prc1.call(ele) && !prc2.call(ele)) || (!prc1.call(ele) && prc2.call(ele)) 
    end
end

def zany_zip(*arr)
    max_size = 0
    arr.each {|sub_arr| max_size = sub_arr.length if sub_arr.length >= max_size}
    new_arr = Array.new(max_size){Array.new(arr.length)}
    arr.each_with_index do |sub_arr, i|
        sub_arr.each_with_index do |el, j|
            new_arr[j][i] = el
        end
    end
    new_arr
end

def maximum(arr, &prc)
    return nil if arr.length == 0
    max = arr[0]
    arr.each do |ele|
        max = ele if prc.call(ele) >= prc.call(max)
    end
    max
end

def my_group_by(arr, &prc)
    new_hash = Hash.new{|h,v| h[v] = []}

    arr.each do |el|
        key = prc.call(el)
        new_hash[key] << el
    end
    new_hash
end

def max_tie_breaker(arr, prc1, &prc2)
     return nil if arr.length == 0

     max = arr[0]
     arr.each do |ele|
        result = prc2.call(ele)
        max_result = prc2.call(max)
        if result > max_result
            max = ele
        elsif result == max_result && prc1.call(ele) > prc1.call(max)
            max = ele
        end
     end
     max
end

def silly_syllables(str)
    vowels = "aeiou"
    count = 0
    new_sent = []
    str.split(" ").each do |word|
        count = word.split("").count {|char| vowels.include?(char)}
        if count <2 
            new_sent << word
        else
            new_word = remove_before_vowels(word)
            new_word = remove_before_vowels(new_word.reverse)
            new_sent << new_word.reverse
        end
    end
    new_sent.join(" ")
end

def remove_before_vowels(word)
    vowels = "aeiou"

    word.each_char.with_index do |char, i|
        if vowels.include?(char)
            word = word[i..-1]
            break
        end
    end
    word
end