load(::Day{6}, path) = parse.(Int, split(readline(path), ","))

# Part 1 & 2 use the same code
function count_lanternfish(init_fish, days)
    # Keep Julia's 1-based indexing in mind: counts[i] = fish with i-1 days left to live
    counts = map(i -> count(==(i), init_fish), 0:8)
    for _ in 1:days
        born = counts[1]
        counts[1:(end - 1)] = counts[2:end]
        counts[7] += born
        counts[9] = born
    end
    return sum(counts)
end

solve1(::Day{6}, data) = count_lanternfish(data, 80)
solve2(::Day{6}, data) = count_lanternfish(data, 256)

testresult1(::Day{6}) = 5934
testresult2(::Day{6}) = 26984457539
