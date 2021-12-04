using AdventOfCode2021: data_d04, test_d04, winning_score, last_score

# Part 1 – Tests
draws, boards = test_d04()
@test winning_score(draws, boards) == 4512

# Part 2 – Tests
@test last_score(draws, boards) == 1924

# Part 1 – Solution
draws, boards = data_d04()
println("Solution of Day 4 – Part One: $(winning_score(draws, boards))")

# Part 2 – Solution
println("Solution of Day 4 – Part Two: $(last_score(draws, boards))")
