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
    i = 0
    longest = fishes[0]
    while i < fishes.length
        longest = fishes[i] if fishes[i].length > longest.length
        i += 1
    end
    longest
end