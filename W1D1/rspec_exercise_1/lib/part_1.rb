def average(num_1, num_2)
    (num_1 + num_2) / 2.0
end

def average_array(array)
    array.sum / (array.length * 1.0)
end

def repeat(str, n)
    new_str = ""
    n.times { new_str += str }
    new_str 
end

def yell(str)
    str.upcase + "!"
end

def alternating_case(sentence)
    new_sentence = sentence.split(" ").map.with_index do |word, i|
        if i.even?
            word.upcase
        else 
            word.downcase
        end
    end
    new_sentence.join(" ")
end