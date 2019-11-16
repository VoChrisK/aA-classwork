def my_reject(arr, &prc)
    arr.select {|ele| !prc.call(ele) }
end

def my_one?(arr, &prc)
    arr.count { |ele| prc.call(ele) } == 1
    # counter = 0
    # arr.each do |ele|
    #     if prc.call(ele)
    #         counter += 1
    #     end
    # end
    # if counter == 1
    #     true
    # else
    #     false
    # end
end

def hash_select(hash, &prc)
    new_hash = Hash.new()
    hash.each do |k, v|
        if prc.call(k, v) == true
            new_hash[k] = v
        end
    end
    new_hash
end

def xor_select(arr, prc1, prc2)
    arr.select {|ele| (prc1.call(ele) || prc2.call(ele)) && !(prc1.call(ele) && prc2.call(ele))}
end

def proc_count(val, prcs_arr)
    prcs_arr.count { |prc| prc.call(val) }
end