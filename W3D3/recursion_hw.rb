def sum_to(num)
    return nil if num < 1
    return 1 if num == 1
    return num + sum_to(num-1)
end

# # Test Cases
#   p sum_to(5)  # => returns 15
#   p sum_to(1)  # => returns 1
#   p sum_to(9)  # => returns 45
#   p sum_to(-8)  # => returns nil

def add_numbers(nums_array)
    return nil if nums_array.empty?
    return nums_array.pop if nums_array.length == 1
    return nums_array.pop + add_numbers(nums_array)
end

#  # Test Cases
#   p add_numbers([1,2,3,4]) # => returns 10
#   p add_numbers([3]) # => returns 3
#   p add_numbers([-80,34,7]) # => returns -39
#   p add_numbers([]) # => returns nil

def gamma_fnc(num)
    return gamma_function(num-1)
end

def gamma_function(num)
    return nil if num < 0
    return 1 if num <= 1
    return num * gamma_function(num-1)
end

 p gamma_fnc(0)  # => returns nil
 p gamma_fnc(1)  # => returns 1
 p gamma_fnc(4)  # => returns 6
 p gamma_fnc(8)  # => returns 5040

def ice_cream_shop(flavors, favorite)
    return false if flavors.length == 0
    return true if flavors[-1] == favorite
    flavors.pop
    return ice_cream_shop(flavors, favorite)
end

# p ice_cream_shop(['vanilla', 'strawberry'], 'blue moon')  # => returns false
# p ice_cream_shop(['pistachio', 'green tea', 'chocolate', 'mint chip'], 'green tea')  # => returns true
# p ice_cream_shop(['cookies n cream', 'blue moon', 'superman', 'honey lavender', 'sea salt caramel'], 'pistachio')  # => returns false
# p ice_cream_shop(['moose tracks'], 'moose tracks')  # => returns true
# p ice_cream_shop([], 'honey lavender')  # => returns false

def reverse(string)
    return string if string.length <= 1
    return string[-1] + reverse(string[0..-2])
end

# p reverse("house") # => "esuoh"
# p reverse("dog") # => "god"
# p reverse("atom") # => "mota"
# p reverse("q") # => "q"
# p reverse("id") # => "di"
# p reverse("") # => ""