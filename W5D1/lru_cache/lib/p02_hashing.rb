class Integer
  # Integer#hash already implemented for you
end

class Array
  def hash
    hash_number = 0
    self.each_with_index do |ele, i|
      hash_number += ele.hash * (i+1)
    end
    hash_number
  end
end

class String
  def hash
    hash_number = 0
    self.chars.each_with_index do |char, i|
      hash_number += char.ord.hash * (i+1)
    end
    hash_number
  end
end

class Hash
  # This returns 0 because rspec will break if it returns nil
  # Make sure to implement an actual Hash#hash method
  def hash
    hash_number = 0
    self.each do |k,v|
      hash_number += k.to_s.ord.hash + v.to_s.ord.hash
    end
    hash_number
  end
end
