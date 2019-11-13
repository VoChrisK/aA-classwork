require_relative 'p04_linked_list'

class HashMap
  include Enumerable
  attr_accessor :count

  def initialize(num_buckets = 8)
    @store = Array.new(num_buckets) { LinkedList.new }
    @count = 0
  end

  def include?(key)
    current_bucket = bucket(key)
    return true if current_bucket.include?(key)
    false
  end

  def set(key, val)
    current_bucket = bucket(key)
    if include?(key)
      current_bucket.update(key, val)
    else
      current_bucket.append(key, val)
      change_count(:inc)
    end

    if count >= num_buckets
      resize!
    end
  end

  def get(key)
    if include?(key)
      current_bucket = bucket(key)
      current_bucket.get(key)
    end
  end

  def delete(key)
    if include?(key)
      current_bucket = bucket(key)
      current_bucket.remove(key)
      change_count(:dec)
    end
  end

  def change_count(order)
    case order
    when :inc
      @count += 1
    when :dec
      @count -= 1
    end
  end

  def each
    store.each do |bucket|
      bucket.each do |node|
        yield(node.key, node.val)
      end
    end
  end

  # uncomment when you have Enumerable included
  def to_s
    pairs = inject([]) do |strs, (k, v)|
      strs << "#{k.to_s} => #{v.to_s}"
    end
    "{\n" + pairs.join(",\n") + "\n}"
  end

  alias_method :[], :get
  alias_method :[]=, :set

  private

  def num_buckets
    @store.length
  end

  def hash_function(num)
    num.hash % num_buckets
  end

  def resize!
    double_length = Array.new(num_buckets) { LinkedList.new }
    current_eles = get_eles_from_buckets!
    @store.concat(double_length)
    rehash_eles!(current_eles)
  end

  def get_eles_from_buckets!
    current_eles = []
    @store.each do |bucket|
      bucket.each do |list|
        current_eles << [list.key, list.val]
        delete(list.key)
      end
    end
    current_eles
  end

  def rehash_eles!(current_eles)
    current_eles.each do |ele|
      set(ele[0], ele[1])
    end
  end

  def bucket(key)
    # optional but useful; return the bucket corresponding to `key`
    store[hash_function(key)]
  end

  attr_reader :store
end
