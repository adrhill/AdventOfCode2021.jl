# Day 8: Seven Segment Search
load(::Day{8}, path) = map(l -> split(l, " ")[[1:10..., 12:end...]], readlines(path))

# Part 1 – count digits with unique number of segments
# {1, 7, 4, 8} with lengths [2, 3, 4, 7]
function solve1(::Day{8}, data)
    return sum(
        map(data) do line
            sum(map(l -> in(l, [2, 3, 4, 7]), length.(line[11:end])))
        end,
    )
end

# Part 2
# compute canonical representation (upper case):
#    AAAA    Lengths of digits:
#   B    C     l2: 1
#   B    C     l3: 7
#    DDDD      l4: 4
#   E    F     l5: 2, 3, 5
#   E    F     l6: 0, 6, 9
#    GGGG      l7: 8

Digits = Dict{Set{Char},Int}(
    Set(['C', 'F']) => 1,
    Set(['A', 'C', 'F']) => 7,
    Set(['B', 'C', 'D', 'F']) => 4,
    Set(['A', 'C', 'D', 'E', 'G']) => 2,
    Set(['A', 'C', 'D', 'F', 'G']) => 3,
    Set(['A', 'B', 'D', 'F', 'G']) => 5,
    Set(['A', 'B', 'C', 'E', 'F', 'G']) => 0,
    Set(['A', 'B', 'D', 'E', 'F', 'G']) => 6,
    Set(['A', 'B', 'C', 'D', 'F', 'G']) => 9,
    Set(['A', 'B', 'C', 'D', 'E', 'F', 'G']) => 8,
)

function decode_line(line)
    sets = unique(Set.(line))
    lens = length.(sets)

    S1 = sets[findfirst(==(2), lens)] # set of digit 1
    S4 = sets[findfirst(==(4), lens)] # set of digit 4
    S7 = sets[findfirst(==(3), lens)] # set of digit 7
    S8 = sets[findfirst(==(7), lens)] # set of digit 8

    L5 = sets[lens .== 5] # sets of digits with lenght 5
    L6 = sets[lens .== 6] # sets of digits with lenght 6

    # There probably is a more efficient order of these operations...
    BD = setdiff(S4, S1) # set of characters at B and D
    CF = intersect(S4, S7)
    EG = setdiff(S8, union(S4, S7))
    ADG = reduce(intersect, L5)
    ABFG = reduce(intersect, L6)

    A = first(setdiff(S7, S1)) # char at canonical position A
    B = first(setdiff(BD, ADG))
    C = first(setdiff(CF, ABFG))
    D = first(setdiff(BD, B))
    E = first(setdiff(EG, ADG))
    F = first(setdiff(CF, C))
    G = first(setdiff(EG, E))

    rv_dict = Dict('A' => A, 'B' => B, 'C' => C, 'D' => D, 'E' => E, 'F' => F, 'G' => G)
    fw_dict = Dict(v => k for (k, v) in rv_dict)

    ds = map(line[(end - 3):end]) do code
        # Turn the output code to chars, map them to set of canonical representations A-F
        # then use this set as a key to obtain the final digit
        Digits[Set(map(k -> fw_dict[k], first.(split(code, ""))))]
    end
    return 1000 * ds[1] + 100 * ds[2] + 10 * ds[3] + ds[4]
end
solve2(::Day{8}, data) = sum(decode_line.(data))

testresult1(::Day{8}) = 26
testresult2(::Day{8}) = 61229
