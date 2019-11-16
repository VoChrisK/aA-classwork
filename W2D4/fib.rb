require "byebug"

def fib(n)
    return 0 if n == 0
    return 1 if n == 1 || n == 2
    return fib(n-1) + fib(n-2)
end

def fib_dp(n, arr)
    # debugger
    return 0 if n == 0
    return 1 if n == 1 || n == 2
    return arr[n] if arr[n] != nil
    arr[n] = fib_dp(n-1, arr) + fib_dp(n-2, arr)
    return arr[n]
end

def fib_dp_iter(n, arr)
    return 0 if n == 0
    return 1 if n == 1 || n == 2
    arr[0] = 1
    arr[1] = 1
    i = 2
    while i < n
        arr[i] = arr[i-1] + arr[i-2]
        i += 1
    end

    return arr[n-1]
end

# n = 30000
# # p fib(n)
# # p fib_dp(n, Array.new(n))
# p fib_dp_iter(n, Array.new(n))