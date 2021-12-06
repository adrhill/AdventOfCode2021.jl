using AdventOfCode2021: data_d06, count_lanternfish

# Part 1 – Tests
testdata = [3, 4, 3, 1, 2]
@test count_lanternfish(testdata, 80) == 5934

# Part 1 – Solution
data = data_d06()
println("Solution of Day 6 – Part One: $(count_lanternfish(data, 80))")

# Part 2 – Tests
@test count_lanternfish(testdata, 256) == 26984457539

# Part 2 – Solution
println("Solution of Day 6 – Part Two: $(count_lanternfish(data, 256))")
