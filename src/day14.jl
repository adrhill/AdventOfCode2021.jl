# Day 14: Extended Polymerization
function load(::Day{14}, path)
    lines = readlines(path)
    polymer = first.(split(lines[1], ""))
    rules = Dict(
        map(lines[3:end]) do l
            ins, out = split(l, " -> ")
            return first.(split(ins, "")), first(out)
        end,
    )

    return polymer, rules
end

# Part 1 – score polymer after 10 steps
function pair_insert(polymer, rules)
    n = length(polymer)
    out = Vector{Char}(undef, 2 * n - 1)

    for i in 0:(n - 2)
        out[2 * i + 1] = polymer[i + 1]
        out[2 * i + 2] = rules[polymer[(i + 1):(i + 2)]]
    end
    out[end] = polymer[end]
    return out
end

function score_polymer(polymer::Vector{Char})
    elements = unique(polymer)
    counts = [count(==(elem), polymer) for elem in elements]
    min, max = extrema(counts)
    return max - min
end

function polymerize(data, steps)
    polymer, rules = data
    for _ in 1:steps
        polymer = pair_insert(polymer, rules)
    end
    return polymer
end

solve1(::Day{14}, data) = score_polymer(polymerize(data, 10))

# Part 2
# solve1(::Day{14}, data) = score_polymer(polymerize(data, 40))

testresult1(::Day{14}) = 1588
testresult2(::Day{14}) = 2188189693529
