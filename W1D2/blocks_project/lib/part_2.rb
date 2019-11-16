def all_words_capitalized?(words)
    words.all? do |word| 
        word[0] == word[0].upcase && word[1..-1] == word[1..-1].downcase
    end
end

def no_valid_url?(urls)
    urls.none? { |url| url.end_with?(".com", ".net", ".io", ".org") }
end

def any_passing_students?(students)
    students.any? do |student|
        average(student[:grades]) >= 75
    end
end

def average(grades) 
    grades.sum / (grades.length * 1.0)
end