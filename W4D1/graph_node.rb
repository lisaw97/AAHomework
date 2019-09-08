require 'set'
require 'byebug'
class GraphNode
    attr_accessor :val, :neighbors

    def initialize(val)
        @val = val
        @neighbors = []
    end
end

def bfs(starting_node, target_value)
    queue = [starting_node]
    visited = Set.new()
    until queue.empty?
        node = queue.shift
        if !visited.include?(node.val)
            puts node.val
            return node  if node.val == target_value
            visited.add(node.val)
            queue.concat(node.neighbors)
        end
    end
    puts "not found"
    nil
end

a = GraphNode.new('a')
b = GraphNode.new('b')
c = GraphNode.new('c')
d = GraphNode.new('d')
e = GraphNode.new('e')
f = GraphNode.new('f')
a.neighbors = [b, c, e]
c.neighbors = [b, d]
e.neighbors = [a]
f.neighbors = [e]

puts "bfs: "
bfs(a, 'b')
