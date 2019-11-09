def first_anagram?(str1, str2)
    anagrams = str1.split('').permutation(str1.size).to_a.map(&:join)
    anagrams.include?(str2)
end

p first_anagram?("gizmo", "sally")    #=> false
p first_anagram?("elvis", "lives")    #=> true


def second_anagram?(str1, str2)
    arr2 = str2.chars
    str1.each_char do |char|
        idx = arr2.find_index(char)
        if idx.nil?
            return false
        else
            arr2.delete_at(idx)
        end
    end
    true
end

p second_anagram?("gizmo", "sally")    #=> false
p second_anagram?("elvis", "lives")    #=> true


def third_anagram?(str1, str2)
    str1.split('').sort.join == str2.split('').sort.join
end

p third_anagram?("gizmo", "sally")    #=> false
p third_anagram?("elvis", "lives")    #=> true

def fourth_anagram?(str1, str2)
    hash = Hash.new(0)
    return false unless str1.size == str2.size
    (0...str1.size).each do |idx|
        hash[str1[idx]] += 1 
        hash[str2[idx]] -= 1 
    end
    hash.values.uniq.one?
end

p fourth_anagram?("gizmo", "sally")    #=> false
p fourth_anagram?("elvis", "lives")    #=> true