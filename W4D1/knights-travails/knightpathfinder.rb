require_relative "./polytreenode/skeleton/lib/00_tree_node.rb"

class KnightPathFinder
    attr_reader :root_node

    def self.valid_moves(current_pos)
        row, col = current_pos
        row >= 0 && row < 8 && col >= 0 && col < 8 
    end

    def initialize(start_pos)
        @root_node = PolyTreeNode.new(start_pos)
        @considered_positions = [start_pos]
        self.build_move_tree
    end

    def build_move_tree
        queue = [@root_node]

        until queue.empty?
            current_pos = queue.pop
            next_pos = new_move_positions(current_pos.value)
            next_pos.each do |pos|
                child = PolyTreeNode.new(pos)
                child.parent = current_pos
                queue.unshift(child)
            end
        end
    end

    def generate_positions(pos)
        positions = []
        row, col = pos
        positions << [(row + 1), (col + 2)]
        positions << [(row + 1), (col - 2)]
        positions << [(row - 1), (col + 2)]
        positions << [(row - 1), (col - 2)]

        positions << [(row + 2), (col + 1)]
        positions << [(row + 2), (col - 1)]
        positions << [(row - 2), (col + 1)]
        positions << [(row - 2), (col - 1)]

        return positions
    end

    def new_move_positions(current_pos)
        positions = generate_positions(current_pos)
        positions = positions.select do |pos|
            !@considered_positions.include?(pos) && KnightPathFinder.valid_moves(pos)
        end
        @considered_positions.concat(positions)
        positions
    end

    def find_path_bfs(end_pos)
        queue = [@root_node]

        until queue.empty?
            current_pos = queue.pop
            return trace_path_back(current_pos) if current_pos.value == end_pos
            current_pos.children.each do |child|
                queue.unshift(child)
            end
        end

        nil
    end

    # def find_path_dfs(starting_pos, end_pos)
    #     return end_pos if starting_pos.value == end_pos
        
    #     starting_pos.children.each do |child|
    #         res = []
    #         res.concat(find_path_dfs(child, end_pos))
    #         return res unless res.empty?
    #     end
    #     nil
    # end

    def trace_path_back(pos)
        return [@root_node.value] if @root_node.value == pos.value

        trace_path_back(pos.parent) << pos.value
    end

end

kpf = KnightPathFinder.new([0, 0])
p kpf.find_path_bfs([7, 6]) # => [[0, 0], [1, 2], [2, 4], [3, 6], [5, 5], [7, 6]]
p kpf.find_path_bfs([6, 2]) # => [[0, 0], [1, 2], [2, 0], [4, 1], [6, 2]]
# p kpf.find_path_dfs(kpf.root_node, [7, 6])