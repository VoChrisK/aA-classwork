class Node
  attr_reader :key
  attr_accessor :val, :next, :prev

  def initialize(key = nil, val = nil)
    @key = key
    @val = val
    @next = nil
    @prev = nil
  end

  def to_s
    "#{@key}: #{@val}"
  end
end

class LinkedList
  include Enumerable

  def initialize
    @head = Node.new
    @tail = Node.new
    @head.next = @tail
    @tail.prev = @head
  end

  def [](i)
    each_with_index { |link, j| return link if i == j }
    nil
  end

  def first
    @head.next
  end

  def last
    @tail.prev
  end

  def empty?
    @head.next == @tail
  end

  def get(key)
    prc = Proc.new do |traverse, key|
      if traverse.key == key
        return traverse.val
      end
    end

    traverse_list(prc, key)
  end

  def include?(key)
    prc = Proc.new do |traverse, key|
      if traverse.key == key
        return true
      end
    end

    traverse_list(prc, key) ? true : false
  end

  def append(key, val)
    new_node = Node.new(key, val)
    new_node.next = @tail
    new_node.prev = @tail.prev
    @tail.prev.next = new_node
    @tail.prev = new_node
  end

  def update(key, val)
    prc = Proc.new do |traverse, key, val|
      traverse.val = val if traverse.key == key
    end

    traverse_list(prc, key, val)
  end

  def remove(key)
    prc = Proc.new do |traverse, key|
      if traverse.key == key
        traverse.prev.next = traverse.next
        traverse.next.prev = traverse.prev
      end
    end

    traverse_list(prc, key)
  end

  def remove_node(node)
    node.prev.next = node.next
    node.next.prev = node.prev
  end

  def each
    prc = Proc.new { |traverse| yield(traverse) }
    traverse_list(prc)
  end

  private
  
  def traverse_list(prc, *args)
    traverse = @head.next
    while traverse != @tail
      prc.call(traverse, *args)
      traverse = traverse.next
    end
  end

  # uncomment when you have `each` working and `Enumerable` included
  def to_s
    inject([]) { |acc, link| acc << "[#{link.key}, #{link.val}]" }.join(", ")
  end
end
