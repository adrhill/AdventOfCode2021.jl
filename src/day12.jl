# Day 12: Passage Pathing
load(::Day{12}, path) = split.(readlines(path), "-")

# Part 1 - count number of paths through caves
function connected_caves(str, data)
    tuples = filter(t -> (str in t), data)
    return delete!(Set(reduce(vcat, filter.((!=)(str), tuples))), "start")
end

function solve1(::Day{12}, data)
    # Pre-compute look-up table of connected caves for each cave
    caves = unique(vcat(data...))
    connections = Dict([(cave, connected_caves(cave, data)) for cave in caves])

    # We can use recursion as there are no cyclic paths
    function count_leaves(visited::Vector{<:AbstractString})
        last_cave = visited[end]
        last_cave == "end" && (return 1) # is leaf itself

        visited_small_caves = filter(c -> islowercase(c[1]), visited)
        next_caves = filter(!in(visited_small_caves), connections[last_cave])
        length(next_caves) == 0 && (return 0) # is dead end

        return sum(count_leaves(vcat(visited, c)) for c in next_caves)
    end

    # Call recursion on start node
    return count_leaves(["start"])
end

# Part 2 – we can visit _a single_ small cave twice
function solve2(::Day{12}, data)
    caves = unique(vcat(data...))
    connections = Dict([(cave, connected_caves(cave, data)) for cave in caves])

    function count_leaves(visited::Vector{<:AbstractString})
        last_cave = visited[end]
        last_cave == "end" && (return 1) # is leaf itself

        visited_small_caves = filter(c -> islowercase(c[1]), visited)

        # The only change here is that we can visit a single small cave twice
        if any(count(i -> i == c, visited_small_caves) >= 2 for c in visited_small_caves)
            next_caves = filter(!in(visited_small_caves), connections[last_cave])
        else
            next_caves = connections[last_cave]
        end

        length(next_caves) == 0 && (return 0) # is dead end
        return sum(count_leaves(vcat(visited, c)) for c in next_caves)
    end

    # Call recursion on start node
    return count_leaves(["start"])
end

testresult1(::Day{12}) = 10
testresult2(::Day{12}) = 36
