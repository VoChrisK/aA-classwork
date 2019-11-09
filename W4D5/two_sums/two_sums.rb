def bad_two_sum?(arr, target)
    arr.size.times do |idx1|
        (idx1+1...arr.size).each do |idx2|
            return true if arr[idx1] + arr[idx2] == target
        end
    end
    false
end

def okay_two_sums?(arr, target)

end

def two_sum?(arr, target)
    hash = {}
    # arr.size.times do |idx|
    #     hash[idx] = arr[idx]
    #     return true if hash.values.include?(target - arr[idx])
    # end
    
    arr.each_with_index do |ele, i|
        hash[i] = ele
        return true if hash.values.include?(target - ele)
    end
    false
end

arr = [0, 1, 5, 5, 7]
p two_sum?(arr, 6) # => should be true
p two_sum?(arr, 10) # => should be false