# Day 14: Extended Polymerization
function addinsert!(d::Dict, key, val)
    if haskey(d, key)
        d[key] += val
    else
        d[key] = val
    end
end

function load(::Day{14}, path)
    lines = readlines(path)
    polymer = first.(split(lines[1], ""))

    pairs = Dict{Vector{Char},Int}()
    for i in 1:(length(polymer) - 1)
        pair = polymer[i:(i + 1)]
        addinsert!(pairs, pair, 1)
    end

    rules = Dict(
        map(lines[3:end]) do l
            ins, out = split(l, " -> ")
            return first.(split(ins, "")), first(out)
        end,
    )

    return pairs, rules, polymer[end]
end

# Part 1 & 2 are the same – at least after rewriting part 1
function pair_insert(pairs, rules)
    new_pairs = Dict{Vector{Char},Int}()
    for (pair, count) in pairs
        elem = rules[pair]
        addinsert!(new_pairs, [pair[1], elem], count)
        addinsert!(new_pairs, [elem, pair[2]], count)
    end
    return new_pairs
end

function score_polymer(pairs, last_elem)
    element_count = Dict{Char,Int}()
    for (pair, count) in pairs
        addinsert!(element_count, pair[1], count)
    end
    addinsert!(element_count, last_elem, 1)
    min, max = extrema(values(element_count))
    return max - min
end

function polymerize(pairs, rules, steps)
    for _ in 1:steps
        pairs = pair_insert(pairs, rules)
    end
    return pairs
end

function solve1(::Day{14}, data)
    pairs, rules, last_element = data
    return score_polymer(polymerize(pairs, rules, 10), last_element)
end
function solve2(::Day{14}, data)
    pairs, rules, last_element = data
    return score_polymer(polymerize(pairs, rules, 40), last_element)
end

testresult1(::Day{14}) = 1588
testresult2(::Day{14}) = 2188189693529
