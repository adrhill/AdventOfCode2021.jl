abstract type Direction end
struct Forward <: Direction end
struct Up <: Direction end
struct Down <: Direction end
const Command = Tuple{<:Direction,<:Integer}

const directions = Dict("forward" => Forward(), "up" => Up(), "down" => Down())

# Load data
function load(::Day{2}, path)
    return map(readlines(path)) do line
        dir, incr = split(line, " ")
        directions[dir], parse(Int, incr)
    end
end

mutable struct Submarine{T<:Integer}
    depth::T
    hpos::T
    aim::T
end
Submarine() = Submarine(0, 0, 0)

# Part 1
move_submarine!(s::Submarine, c::Command) = move_submarine!(s, c...)
move_submarine!(s::Submarine, ::Forward, incr) = (s.hpos += incr)
move_submarine!(s::Submarine, ::Down, incr) = (s.depth += incr)
move_submarine!(s::Submarine, ::Up, incr) = (s.depth -= incr)

# Part 2
move_submarine2!(s::Submarine, c::Command) = move_submarine2!(s, c...)
move_submarine2!(s::Submarine, ::Down, incr) = (s.aim += incr)
move_submarine2!(s::Submarine, ::Up, incr) = (s.aim -= incr)
function move_submarine2!(s::Submarine, ::Forward, incr)
    s.hpos += incr
    s.depth += s.aim * incr
    return nothing
end

function solve1(::Day{2}, data)
    sub = Submarine()
    for command in data
        move_submarine!(sub, command)
    end
    return sub.depth * sub.hpos
end

function solve2(::Day{2}, data)
    sub = Submarine()
    for command in data
        move_submarine2!(sub, command)
    end
    return sub.depth * sub.hpos
end

testresult1(::Day{2}) = 150
testresult2(::Day{2}) = 900
