using AdventOfCode2021: Forward, Up, Down, parse_command, data_d02
using AdventOfCode2021: Submarine, move_submarine!, move_submarine2!

@test parse_command("forward 2") == (Forward(), 2)
@test parse_command("down 2") == (Down(), 2)

# Part 1 – Tests
testdata = [
    (Forward(), 5), (Down(), 5), (Forward(), 8), (Up(), 3), (Down(), 8), (Forward(), 2)
]

sub = Submarine()
for command in testdata
    move_submarine!(sub, command)
end
@test sub.depth == 10
@test sub.hpos == 15

# Part 1 – Solution
data = data_d02()
sub = Submarine()
for command in data
    move_submarine!(sub, command)
end
println("Solution of Day 2 – Part One: $(sub.depth * sub.hpos)")

# Part 2 – Tests
sub = Submarine()
for command in testdata
    move_submarine2!(sub, command)
end
@test sub.hpos == 15
@test sub.depth == 60

# Part 2 – Solution
sub = Submarine()
for command in data
    move_submarine2!(sub, command)
end
println("Solution of Day 2 – Part Two: $(sub.depth * sub.hpos)")
