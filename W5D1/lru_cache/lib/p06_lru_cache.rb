require_relative 'p05_hash_map'
require_relative 'p04_linked_list'

class LRUCache
  def initialize(max, prc)
    @map = HashMap.new
    @store = LinkedList.new
    @max = max
    @prc = prc
  end

  def count
    @map.count
  end

  def get(key)
    val = @prc.call(key)
    if map.include?(key)
      node = map.get(key) #will give me the node's refernce in LL
      update_node!(node)
    else
      store.append(key, val)
      map.set(val, store.last)
    end
  end

  def to_s
    'Map: ' + @map.to_s + '\n' + 'Store: ' + @store.to_s
  end

  private

  def calc!(key)
    # suggested helper method; insert an (un-cached) key
  end

  def update_node!(node)
    # suggested helper method; move a node to the end of the list
    store.remove_node(node)
    store.append(node.key, node.val)
  end

  def eject!
    
  end

  attr_reader :map, :store
end
