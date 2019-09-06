# Exercise 1 - Stack
class Stack

    def initialize
      # create ivar to store stack here!
        @stack = []
    end

    def push(el)
      # adds an element to the stack
        @stack.push(el)
    end

    def pop
      # removes one element from the stack
        @stack.pop
    end

    def peek
      # returns, but doesn't remove, the top element in the stack
        @stack[-1]
    end
  end

# Exercise 2 - Queue
class Queue
    def initialize
        @queue = []
    end

    def enqueue(el)
        @queue.push(el)
    end

    def dequeue
        @queue.shift
    end

    def peek
        @queue[0]
    end
end

# Exercise 3 - Map
class Map
    def initialize
        @map = Array.new {Array.new(2)}
    end

    def set(key, value)
        @map.each do |set|
            if set[0] == key
                set[1] = value
                return
            end
        end
        @map << [key, value]
    end

    def get(key)
        @map.each do |set|
            return set[1] if set[0] == key
        end
        @map
    end

    def delete(key)
        @map.each_with_index do |set, i|
            @map.delete_at(i) if set[0] == key
        end
    end

    def show
        p @map
    end
end
