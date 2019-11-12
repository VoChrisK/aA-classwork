require "byebug"
class MaxIntSet
  attr_reader :store

  def initialize(max)
    @store = Array.new(max) { false }
  end

  def insert(num)
    if is_valid?(num)
      store[num] = true
    else
      raise "Out of bounds"
    end
  end

  def remove(num)
    if is_valid?(num)
      store[num] = false
    end
  end

  def include?(num)
    return false unless store[num]
    true
  end

  private

  def is_valid?(num)
    num >= 0 && num < store.length
  end
end


class IntSet
  attr_reader :store

  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
  end

  def insert(num)
    bucket = hash_function(num)
    self[bucket] << num
  end

  def remove(num)
    bucket = hash_function(num)
    self[bucket].delete(num)
  end

  def include?(num)
    bucket = hash_function(num)
    return false unless self[bucket].include?(num)
    true
  end

  private

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
    @store[num]
  end

  def num_buckets
    @store.length
  end

  def hash_function(num)
    num % num_buckets
  end
end

class ResizingIntSet
  attr_reader :count

  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def insert(num)
    bucket = hash_function(num)
    if !self[bucket].include?(num)
      self[bucket] << num
      @count += 1
    end
    
    if @count >= num_buckets
      resize!
    end
  end

  def remove(num)
    bucket = hash_function(num)
    if self[bucket].include?(num)
      self[bucket].delete(num)
      @count -= 1
    end
  end

  def include?(num)
    bucket = hash_function(num)
    return false unless self[bucket].include?(num)
    true
  end

  private

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
    @store[num]
  end

  def num_buckets
    @store.length
  end

  def hash_function(num)
    num % num_buckets
  end

  # initial problem: I first doubled the number of buckets and then I invoke the rehash_eles! method. When I remove an element of a bucket, I'm looking for the element in the old bucket instead of the new bucket.
  def resize!
    double_length = Array.new(num_buckets) { Array.new }
    current_eles = get_eles_from_buckets
    delete_eles_from_buckets!
    @store.concat(double_length)
    rehash_eles!(current_eles)
  end

  def get_eles_from_buckets
    current_ele = []
    @store.each do |bucket|
      bucket.each do |ele|
        current_ele << ele
      end
    end
    current_ele
  end

  def delete_eles_from_buckets!
    @store.each do |bucket|
      bucket.each do |ele|
        remove(ele)
      end
    end
  end

  def rehash_eles!(current_eles)
    current_eles.each do |ele|
      insert(ele)
    end
  end

  attr_writer :count
end
