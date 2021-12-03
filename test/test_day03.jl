using AdventOfCode2021: data_d03, bv2int, power_consumption
using AdventOfCode2021: oxygen_generator_rating, co2_scrubber_rating, life_support_rating
testdata = BitMatrix(
    [
        0 0 1 0 0
        1 1 1 1 0
        1 0 1 1 0
        1 0 1 1 1
        1 0 1 0 1
        0 1 1 1 1
        0 0 1 1 1
        1 1 1 0 0
        1 0 0 0 0
        1 1 0 0 1
        0 0 0 1 0
        0 1 0 1 0
    ],
)

# Part 1 – Tests
bv = BitVector([1, 0, 1, 1, 0])
@test bv2int(bv) == 22
@test bv2int(.!bv) == 9
@test power_consumption(testdata) == 198

# Part 1 – Solution
data = data_d03()
println("Solution of Day 3 – Part One: $(power_consumption(data))")

# Part 2 – Tests
@test oxygen_generator_rating(testdata) == 23
@test co2_scrubber_rating(testdata) == 10
@test life_support_rating(testdata) == 230

# Part 2 – Solution
println("Solution of Day 3 – Part Two: $(life_support_rating(data))")
