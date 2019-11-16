def reverser(str, &proc)
    proc.call(str.reverse)
end

def word_changer(sentence, &proc)
    new_sentence = sentence.split(" ")
    sentence = new_sentence.map do |ele|
        proc.call(ele)
    end
    sentence.join(" ")
end

def greater_proc_value(num, proc1, proc2)
    result1 = proc1.call(num)
    result2 = proc2.call(num)
    if result1 > result2
        return result1
    else
        return result2
    end
end

def and_selector(arr, proc1, proc2)
    arr.select do |ele|
        if proc1.call(ele) && proc2.call(ele)
            ele
        end
    end
end

def alternating_mapper(arr, proc1, proc2)
    arr.map.with_index do |ele, i|
        if i % 2 == 0
            proc1.call(ele)
        else
            proc2.call(ele)
        end
    end
end