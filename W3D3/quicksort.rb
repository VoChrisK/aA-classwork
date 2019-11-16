def quicksort(arr)
    return arr if arr.length <= 1

    partition_idx = rand(0...arr.length)
    arr[partition_idx], arr[-1] = arr[-1], arr[partition_idx]
    less_than = 0
    greater_than_or_equal = 0
    while greater_than_or_equal < arr.length - 1
        if arr[greater_than_or_equal] < arr[-1]
            arr[less_than], arr[greater_than_or_equal] = arr[greater_than_or_equal], arr[less_than]
            less_than += 1
        end
        greater_than_or_equal += 1
    end
    arr[-1], arr[less_than] = arr[less_than], arr[-1]
    quicksort(arr[0...less_than]) + [arr[less_than]] + quicksort(arr[less_than+1..-1])
end

arr = [3, 2, 7, 4, 6, 5, 8, 1]
arr = (1..1000).to_a.shuffle
p arr
p quicksort(arr)
