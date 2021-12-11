using Statistics: median!

# Data loading
load(::Day{7}, path) = parse.(Int, split(readline(path), ","))

# Part 1 - fuel of crab submarines
solve1(::Day{7}, pos) = sum(abs.(pos .- Int(median!(pos))))

# Part 2 - fuel of crab submarines 2
@inline triag(n) = div(n * (n + 1), 2) # fuel spent is a triangular number
solve2(::Day{7}, pos) = minimum(sum(triag.(abs.(pos .- h))) for h in 0:maximum(pos))

testresult1(::Day{7}) = 37
testresult2(::Day{7}) = 168
