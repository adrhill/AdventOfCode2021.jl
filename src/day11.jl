# Day 11: Dumbo Octopus
load(::Day{11}, path) = parse.(Int, hcat(split.(readlines(path), "")...)) # transposed!

# Part 1 – count flashes in cellular automaton
function moore_neighborhood(I::CartesianIndex; xmax=10, ymax=10)
    r, c = Tuple(I)
    r₋, r₊ = clamp.([r - 1, r + 1], 1, xmax)
    c₋, c₊ = clamp.([c - 1, c + 1], 1, ymax)
    return CartesianIndices((r₋:r₊, c₋:c₊))
end

function solve1(::Day{11}, data; steps=100)
    data = deepcopy(data) # in-place `solve1!` could comment out this line for performance
    count = 0
    for i in 1:steps
        data .+= 1
        to_spread = Set(findall((==)(10), data))

        while !isempty(to_spread)
            neighbors = moore_neighborhood(pop!(to_spread))
            data[neighbors] .+= 1
            new_flashes = filter(n -> data[n] == 10, neighbors)
            union!(to_spread, new_flashes)
        end

        flashed = data .> 9
        count += sum(flashed)
        data[flashed] .= 0
    end

    return count
end

# Part 2 - return step in which octopuses synchronize
function solve2(::Day{11}, data; steps=100)
    data = deepcopy(data) # in-place `solve1!` could comment out this line for performance
    step = 1
    while true # iterate until value is returned on synchronization
        data .+= 1
        to_spread = Set(findall((==)(10), data))

        while !isempty(to_spread)
            neighbors = moore_neighborhood(pop!(to_spread))
            data[neighbors] .+= 1
            new_flashes = filter(n -> data[n] == 10, neighbors)
            union!(to_spread, new_flashes)
        end

        flashed = data .> 9
        data[flashed] .= 0

        if sum(flashed) == 100
            return step
        end
        step += 1
    end
end

testresult1(::Day{11}) = 1656
testresult2(::Day{11}) = 195
