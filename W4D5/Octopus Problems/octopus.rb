# fishes = ['fish', 'fiiish', 'fiiiiish', 'fiiiish', 'fffish', 'ffiiiiisshh', 'fsh', 'fiiiissshhhhhh']
# => "fiiiissshhhhhh"

# Sluggish Octopus
# Find the longest fish in O(n^2) time. Do this by comparing all fish lengths to all other fish lengths
def sluggish_octopus(fishes)
    longest = fishes[0]
    (1...fishes.length).each do |i|
        longest = fishes[i] if fishes[i].length > longest.length
    end
    longest
end

# Dominant Octopus
# Find the longest fish in O(n log n) time. Hint: You saw a sorting algorithm that runs in O(n log n) in the Sorting Complexity Demo. Remember that Big O is classified by the dominant term.
def dominant_octopus(fishes)
    return fishes if fishes.length < 2
    mid = fishes.length / 2
    left = dominant_octopus(fishes.take(mid))
    right = dominant_octopus(fishes.drop(mid))
    sorted = merge(left, right)
    sorted.last
end

def merge(left, right)
    merged = []
    until left.empty? || right.empty?
        if left.first.length < right.first.length
            merged << left.shift
        else
            merged << right.shift
        end
    end
    merged + left + right
end

# Clever Octopus
# Find the longest fish in O(n) time. The octopus can hold on to the longest fish that you have found so far while stepping through the array only once.
def clever_octopus(fishes)
   longest = fishes.first
   fishes.each do |fish|
    if fish.length > longest.length
        longest = fish
    end
   end
   longest
end

# Dancing Octopus
# tiles_array = ["up", "right-up", "right", "right-down", "down", "left-down", "left",  "left-up" ]

# Slow Dance
# Given a tile direction, iterate through a tiles array to return the tentacle number (tile index) the octopus must move. This should take O(n) time.

# slow_dance("up", tiles_array)
# > 0

# slow_dance("right-down", tiles_array)
# > 3

def slow_dance(dir, tiles_arr)
    tiles_arr.index(dir)
end

# Constant Dance!
# Now that the octopus is warmed up, let's help her dance faster. Use a different data structure and write a new function so that you can access the tentacle number in O(1) time.
tiles_hash = {
    "up" => 0,
    "right-up" => 1,
    "right"=> 2,
    "right-down" => 3,
    "down" => 4,
    "left-down" => 5,
    "left" => 6,
    "left-up" => 7
}
def fast_dance(dir, tiles_hash)
    tiles_hash[dir]
end