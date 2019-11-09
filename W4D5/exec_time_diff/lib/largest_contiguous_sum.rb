require "benchmark"

def largest_contiguous_sum(list)
    sub_arrs = []
    list.size.times do |idx1|
        (idx1...list.size).each do |idx2|
            sub_arrs << list[idx1..idx2]
        end
    end
    sub_arrs.map(&:sum).max
end

def largest_contiguous_sum_better(list)
    largest_sum = list.first
    current_sum = 0
    list.each do |num|
        current_sum += num
        current_sum = num if num > current_sum
        largest_sum = current_sum if current_sum > largest_sum
    end
    largest_sum
end

list_1 = [5, 3, -7]
list_2 = [2, 3, -6, 7, -6, 7]
list_3 = [-5, -1, -3]
p largest_contiguous_sum_better(list_1) # => 8
p largest_contiguous_sum_better(list_2) # => 8
p largest_contiguous_sum_better(list_3) # => -1


Benchmark.bm { |b|
    b.report("#largest_contiguous_sum ...") { largest_contiguous_sum(list_1) }
    b.report("#largest_contiguous_sum ...") { largest_contiguous_sum(list_2) }
    b.report("#largest_contiguous_sum ...") { largest_contiguous_sum(list_3) }
}

Benchmark.bm { |b|
    b.report("#largest_contiguous_sum_better ...") { largest_contiguous_sum_better(list_1) }
    b.report("#largest_contiguous_sum_better ...") { largest_contiguous_sum_better(list_2) }
    b.report("#largest_contiguous_sum_better ...") { largest_contiguous_sum_better(list_3) }
}
