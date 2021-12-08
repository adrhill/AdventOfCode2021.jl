load(::Day{1}, path) = parse.(Int, (readlines(path)))

# Part 1 – count increases
solve1(::Day{1}, data) = sum(x -> x > 0, diff(data))

# Part 2: count windowed increases ignoring identical summands in window
function solve2(::Day{1}, data; window=3)
    n = length(data)
    return sum(view(data, (1 + window):n) .> view(data, 1:(n - window)))
end

testresult1(::Day{1}) = 7
testresult2(::Day{1}) = 5
