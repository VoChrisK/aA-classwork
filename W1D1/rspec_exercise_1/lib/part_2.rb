# def hipsterfy(word)
#     vowels = "aeiou"
#     index = 0
#     reverse = word.reverse
#     reverse.each_char.with_index do |char, i|
#         if vowels.include?(char)
#             reverse = reverse[0...i] + reverse[i+1..-1]
#             return reverse.reverse
#         end
#     end
#     word
# end

def hipsterfy(word)
    vowels = "aeiou"
    index = 0
    bool = false

    word.each_char.with_index do |char, i|
       if vowels.include?(char)
         index = i
         bool = true
       end
    end

    if bool
        return word[0...index] + word[index+1..-1]
    else
        return word
    end
end

def vowel_counts(str)
    hash = Hash.new(0)

    str.each_char do |letter|
        hash[letter.downcase] += 1
    end

    hash
end

def caesar_cipher(message, n)
    alphabet = "abcdefghijklmnopqrstuvwxyz"
    chars = message.split("").map do |char|
        if alphabet.include?(char)
            new_index = (alphabet.index(char) + n) % alphabet.length
            alphabet[new_index]
        else
            char
        end
    end

    chars.join("")
end