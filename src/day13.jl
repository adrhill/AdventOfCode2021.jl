# Day 13: Transparent Origami
function load(::Day{13}, path)
    positions = Set{CartesianIndex}()
    folds = Vector{Tuple{Char,Int}}()
    regex = r"fold along ([xy])=(\d+)"
    for line in readlines(path)
        isempty(line) && continue
        instruction = match(regex, line)
        if isnothing(instruction)
            x, y = parse.(Int, split(line, ","))
            push!(positions, CartesianIndex(x, y))
        else
            push!(folds, (first(instruction[1]), parse(Int, instruction[2])))
        end
    end
    return (positions, folds)
end

# Part 1 – single fold
@inline function foldx(I::CartesianIndex, pos)
    x, y = Tuple(I)
    return CartesianIndex(x - 2 * abs(pos - x), y)
end
@inline function foldy(I::CartesianIndex, pos)
    x, y = Tuple(I)
    return CartesianIndex(x, y - 2 * abs(pos - y))
end

function fold!(positions, fold)
    pfold = last(fold)
    if first(fold) == 'x'
        folded = [
            foldx(pop!(positions, p), pfold) for p in filter(p -> p[1] > pfold, positions)
        ]
    else
        folded = [
            foldy(pop!(positions, p), pfold) for p in filter(p -> p[2] > pfold, positions)
        ]
    end
    union!(positions, folded)
    return nothing
end

function solve1(::Day{13}, data)
    positions, folds = data
    fold!(positions, first(folds))
    return length(positions)
end

# Part 2 – show the final code
function show_code(positions::Set{CartesianIndex})
    pos = Tuple.(positions)
    h = maximum(first(t) + 1 for t in pos)
    w = maximum(last(t) + 1 for t in pos)
    img = zeros(Bool, h, w)
    for p in positions
        img[p + CartesianIndex(1, 1)] = 1
    end
    return transpose(img)
end

function solve2(::Day{13}, data)
    positions, folds = data
    for f in folds
        fold!(positions, f)
    end
    # @show show_code(positions) # worth plugging through ImageCore's `Gray`
    return 0
end

testresult1(::Day{13}) = 17

# No test for part 2, just pass:
testresult2(::Day{13}) = 0
test2(::Day{13}) = 0
