# Day 15: Chiton
load(::Day{15}, path) = permutedims(parse.(Int, hcat(split.(readlines(path), "")...)))

# Part 1 – Path finding
# This old bookmark ended up being a useful reference:
# https://www.redblobgames.com/pathfinding/a-star/introduction.html

const VN_OFFSETS = [ # von Neumann neighborhood # TODO: refactor Day 9 to use this!
    CartesianIndex(1, 0),
    CartesianIndex(-1, 0),
    CartesianIndex(0, 1),
    CartesianIndex(0, -1),
]

function pathfind(risk)
    # Allocate matrix tracking total risk
    h, w = size(risk)
    totalrisk = fill(typemax(Int), h, w)

    # Add starting point to queue
    risk_start = 0
    totalrisk[1, 1] = risk_start
    queue = [(CartesianIndex(1, 1), risk_start)] # index, total risk, heuristic

    while !isempty(queue)
        current, risk_so_far = pop!(queue)

        # Return the total risk when a path is found
        if Tuple(current) == (h, w)
            return risk_so_far
        end

        for offset in VN_OFFSETS
            # Check all neighbors iteratively
            neighbor = current + offset
            if checkbounds(Bool, risk, neighbor)
                new_total = risk_so_far + risk[neighbor]
                if new_total < totalrisk[neighbor]
                    totalrisk[neighbor] = new_total
                    push!(queue, (neighbor, new_total))
                end
            end
        end
        # Ideally I'd implement a priority queue, but we'll just sort
        sort!(queue; by=c -> -c[2])
    end
    return totalrisk[h, w]
end

solve1(::Day{15}, data) = pathfind(data)

# Part 2 – tile shifted risk maps and repeat pathfinding
function solve2(::Day{15}, data; n=5)
    mats = [mod1.(data .+ shift, 9) for shift in 0:(2 * n - 1)] # tiles
    risk = hvcat((n), [mats[x + y - 1] for x in 1:n, y in 1:n]...)
    return pathfind(risk)
end

testresult1(::Day{15}) = 40
testresult2(::Day{15}) = 315
