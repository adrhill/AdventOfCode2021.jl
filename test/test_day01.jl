using AdventOfCode2021: data_d01, count_increases
using AdventOfCode2021: windowed_sums, windowed_count_increases

testdata = [199, 200, 208, 210, 200, 207, 240, 269, 260, 263]

# Part 1
@test count_increases(testdata) == 7

data = data_d01()
println("Solution of Day 1 – Part One: $(count_increases(data))")

# Part 2: naive implementation
wsums = windowed_sums(testdata)
@test wsums[1] == 607
@test wsums[2] == 618
@test wsums[end] == 792
@test count_increases(wsums) == 5

# Part 2: ignoring identical summands in window
randdata = rand(600:800, 30)
@test windowed_count_increases(testdata) == 5
@test windowed_count_increases(randdata) == count_increases(windowed_sums(randdata))

println("Solution of Day 1 – Part Two: $(windowed_count_increases(data))")
