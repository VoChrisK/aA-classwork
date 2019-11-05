require "byebug"

class PolyTreeNode
    def initialize(value)
        @value = value
        @parent = nil
        @children = []
    end

    def parent
        @parent
    end

    def children
        @children
    end

    def value
        @value
    end

    def parent=(other_parent)
        @parent.children.delete(self) if !@parent.nil?
       
        @parent = other_parent
        if !other_parent.nil?
           other_parent.children << self if !other_parent.children.include?(self)
        end
    end

    def add_child(child)
        child.parent = self
    end

    def remove_child(other_node)
        raise "error" if !@children.include?(other_node)
        other_node.parent = nil
    end

    # debugger
    def dfs(target)
        return self if value == target
        
        children.each do |child|
            res = child.dfs(target) 
            return res unless res.nil?
        end
        nil
    end

    def bfs(target)
        queue = [self]
        until queue.empty?
            node = queue.shift 
            return node if node.value == target
            node.children.each do |child|
                queue << child
            end
        end
        nil
    end

    def inspect
        @value.inspect
    end
end

# a = PolyTreeNode.new("a")
# b = PolyTreeNode.new("b")
# c = PolyTreeNode.new("c")
# a.parent = b
# a.parent = c
# a.add_child(b)
# a.add_child(c)
# p a.bfs("b")
# d = PolyTreeNode.new("d")
# e = PolyTreeNode.new("e")
# f = PolyTreeNode.new("f")
# g = PolyTreeNode.new("g")
# h = PolyTreeNode.new("h")