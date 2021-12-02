abstract type Direction end
struct Forward <: Direction end
struct Up <: Direction end
struct Down <: Direction end
const Command = Tuple{<:Direction, <:Integer}

const directions = Dict("forward" => Forward(), "up" => Up(), "down" => Down())

function parse_command(line::AbstractString)
    dir, incr = split(line, " ")
    return directions[dir], parse(Int, incr)
end

data_d02() = parse_command.(readlines("../data/day02.txt"))

mutable struct Submarine{T<:Integer}
    depth::T
    hpos::T
    aim::T
end
Submarine() = Submarine(0, 0, 0)

# Movement rules for part 1
move_submarine!(s::Submarine, c::Command) = move_submarine!(s, c...)
move_submarine!(s::Submarine, ::Forward, incr) = (s.hpos += incr)
move_submarine!(s::Submarine, ::Down, incr) = (s.depth += incr)
move_submarine!(s::Submarine, ::Up, incr) = (s.depth -= incr)

# Movement rules for part 2
move_submarine2!(s::Submarine, c::Command) = move_submarine2!(s, c...)
move_submarine2!(s::Submarine, ::Down, incr) = (s.aim += incr)
move_submarine2!(s::Submarine, ::Up, incr) = (s.aim -= incr)
function move_submarine2!(s::Submarine, ::Forward, incr)
    s.hpos += incr
    s.depth += s.aim * incr
    return nothing
end

# Solutions computed in test_day02.jl
