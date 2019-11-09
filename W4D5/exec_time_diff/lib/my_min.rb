require "benchmark"

def my_min(list)
    real_min = 0
    list.each do |ele_1|
        min = 0
        list.each do |ele_2|
            if ele_1 < ele_2
                min = ele_1
            end
        end
        real_min = min if min < real_min
    end
    real_min
end



def my_min_better(list)
    min = list[0]
    list.each do |ele|
        min = ele if ele < min
    end
    min
end

list_1 = [ 0, 3, 5, 4, -5, 10, 1, 90 ]
# p my_min(list)  # =>  -5
list_2 = (0...10_000).to_a.shuffle
# p my_min_better(list)  # =>  1

Benchmark.bm { |b|
    b.report("#my_min ...") { my_min(list_1) }
    b.report("#my_min_better ...") { my_min_better(list_1) }
    b.report("#my_min ...") { my_min(list_2) }
    b.report("#my_min_better ...") { my_min_better(list_2) }
}