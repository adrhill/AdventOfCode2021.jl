using AdventOfCode2021: test_d05, data_d05
using AdventOfCode2021: count_overlaps, count_overlaps2

# Part 1 – Tests
testdata = test_d05()
@test count_overlaps(testdata) == 5

# Part 1 – Solution
data = data_d05()
println("Solution of Day 5 – Part One: $(count_overlaps(data))")

# Part 2 – Tests
@test count_overlaps2(testdata) == 12

# Part 2 – Solution
println("Solution of Day 5 – Part Two: $(count_overlaps2(data))")
