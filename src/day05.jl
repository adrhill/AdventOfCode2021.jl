function load(::Day{5}, path)
    # Shifting indices by 1 for Julia's 1-based indexing
    return [
        [(Tuple(parse.(Int, split(t, ","))) .+ 1) for t in split(l, " -> ")] for
        l in readlines(path)
    ]
end

# Part 1
getx(t::NTuple{2,<:Integer}) = first(t)
gety(t::NTuple{2,<:Integer}) = last(t)
xmax(data) = maximum(maximum(getx.(line) for line in data))
ymax(data) = maximum(maximum(gety.(line) for line in data))
not_diagonal(line) = ==(getx.(line)...) || ==(gety.(line)...)
_range(a, b) = a:sign(b - a):b

function get_indices(line)
    line = sort(line)
    if not_diagonal(line)
        return CartesianIndex(line[1]):CartesianIndex(line[2])
    end
    return CartesianIndex.(_range(getx.(line)...), _range(gety.(line)...))
end

function solve1(::Day{5}, data) # count count overlaps
    counts = zeros(Int, xmax(data), ymax(data))
    @inbounds @simd for line in data
        if not_diagonal(line)
            counts[get_indices(line)] .+= 1
        end
    end
    return sum(counts .> 1)
end

# Part 2 – we just need to remove the `not_diagonal` check
function solve2(::Day{5}, data)
    counts = zeros(Int, xmax(data), ymax(data))
    @inbounds @simd for line in data
        counts[get_indices(line)] .+= 1
    end
    return sum(counts .> 1)
end

testresult1(::Day{5}) = 5
testresult2(::Day{5}) = 12
