# Day 18: Snailfish
mutable struct SnailfishDigit
    number::Int
    depth::Int
    magnitude::Int # multiplier for calculation of magnitude
end
const SnailfishNumber = Vector{SnailfishDigit}

function input2sfn(input)
    # Luckily, today's snailfish numbers are valid Julia code which can be parsed!
    input = eval(Meta.parse(input))
    out = SnailfishNumber()

    _append!(leaf::Int, depth, mag) = push!(out, SnailfishDigit(leaf, depth, mag))
    function _append!(tuple, depth, mag)
        _append!(first(tuple), depth + 1, 3 * mag)
        _append!(last(tuple), depth + 1, 2 * mag)
        return nothing
    end
    _append!(input, 0, 1)
    return out
end

load(::Day{18}, path) = input2sfn.(readlines(path))

# Part 1 – compute magnitude of sum of snailfish numbers
function check_explosion!(sn::SnailfishNumber)
    len = length(sn)
    for (i, s) in enumerate(sn)
        if s.depth > 4
            # Add left value of pair to left neighbor
            i > 1 && (sn[i - 1].number += s.number)
            # Add right value of pair to right neighbor
            i < len - 1 && (sn[i + 2].number += sn[i + 1].number)
            # Remove and replace by zero
            popat!(sn, i + 1)
            s.number = 0
            s.depth -= 1
            s.magnitude = div(s.magnitude, 3)
            return true
        end
    end
    return false
end

function check_split!(sn::SnailfishNumber)
    len = length(sn)
    for (i, s) in enumerate(sn)
        if s.number >= 10
            n, d, m = s.number, s.depth, s.magnitude
            s.number = div(n, 2, RoundDown)
            s.depth += 1
            s.magnitude *= 3
            insert!(sn, i + 1, SnailfishDigit(div(n, 2, RoundUp), d + 1, m * 2))
            return true
        end
    end
    return false
end

function increase_depth!(sn::SnailfishNumber, mag)
    for s in sn
        s.depth += 1
        s.magnitude *= mag
    end
    return sn
end

function add!(a::SnailfishNumber, b::SnailfishNumber)
    append!(increase_depth!(a, 3), increase_depth!(b, 2))
    while true
        check_explosion!(a) && continue
        check_split!(a) && continue
        break
    end
    return a
end

magnitude(sn::SnailfishNumber) = mapreduce(s -> s.number * s.magnitude, +, sn)

solve1(::Day{18}, data) = magnitude(reduce(add!, deepcopy(data)))

# Part 2 – largest magnitude of any sum of two different snailfish numbers
function solve2(::Day{18}, data)
    largest = 0
    len = length(data)
    for i in 1:(len - 1)
        for j in (i + 1):len
            mag = magnitude(add!(deepcopy(data[i]), deepcopy(data[j])))
            mag > largest && (largest = mag)
            mag = magnitude(add!(deepcopy(data[j]), deepcopy(data[i])))
            mag > largest && (largest = mag)
        end
    end
    return largest
end

testresult1(::Day{18}) = 4140
testresult2(::Day{18}) = 3993
