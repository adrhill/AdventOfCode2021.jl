# Day 9: Smoke Basin
load(::Day{9}, path) = parse.(Int, permutedims(hcat(split.(readlines(path), "")...))) # transposed!

# Part 1 – find discrete minima in 4-neighborhood
function is_minimum_in_row(data)
    A = sign.(diff(data; dims=2))
    return (A[:, 1:(end - 1)] .< 0) .& (A[:, 2:end] .> 0)
end
function is_minimum_in_col(data)
    A = sign.(diff(data; dims=1))
    return (A[1:(end - 1), :] .< 0) .& (A[2:end, :] .> 0)
end
function is_minimum(data)
    h, w = size(data)
    padcol = fill(9, h, 1)
    padrow = fill(9, 1, w)

    r = is_minimum_in_row(hcat(padcol, data, padcol))
    c = is_minimum_in_col(vcat(padrow, data, padrow))
    return r .& c
end

solve1(::Day{9}, data) = sum(data[is_minimum(data)] .+ 1)

# Part 2 – naive flood fill
function neighborhood(I::CartesianIndex) # Von Neumann neighborhood
    r, c = Tuple(I)
    return [
        CartesianIndex(r - 1, c),
        CartesianIndex(r + 1, c),
        CartesianIndex(r, c - 1),
        CartesianIndex(r, c + 1),
    ]
end

function solve2(::Day{9}, data)
    h, w = size(data)
    function is_in_basin(I::CartesianIndex)
        r, c = Tuple(I)
        return 1 <= r <= h && 1 <= c <= w && data[I] < 9
    end

    # We make use of the fact that basins never overlap
    function basin_size(I0::CartesianIndex)
        in_basin = Set([I0])
        to_check = Set([I0])
        while !isempty(to_check)
            for I in to_check
                new_in_basin = setdiff(filter(is_in_basin, neighborhood(I)), in_basin)
                union!(in_basin, new_in_basin)
                union!(to_check, new_in_basin)
                pop!(to_check, I)
            end
        end
        return length(in_basin)
    end

    sizes = basin_size.(findall(is_minimum(data)))
    return prod(sort(sizes; rev=true)[1:3])
end

testresult1(::Day{9}) = 15
testresult2(::Day{9}) = 1134
