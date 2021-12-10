# Day 10: Syntax Scoring
# I'm out of my comfort zone here, so everything is naively implemented!

load(::Day{10}, path) = [first.(l) for l in split.(readlines(path), "")]

# Part 1 – find corrupted codes: lines where a chunk closes with the wrong character
char_score = Dict(')' => 3, ']' => 57, '}' => 1197, '>' => 25137)
match_closing = Dict('(' => ')', '[' => ']', '{' => '}', '<' => '>')
is_opening(c::Char) = c in "([{<"

function error_score!(line)
    expected_closing = Char[]
    while !isempty(line)
        c = popfirst!(line)
        if is_opening(c)
            pushfirst!(expected_closing, match_closing[c])
        else
            if c == first(expected_closing)
                popfirst!(expected_closing)
            else
                return char_score[c]
            end
        end
    end
    return 0 # zero error score if no error was found
end

function solve1(::Day{10}, data)
    data = deepcopy(data) # in-place `solve1!` could comment out this line for performance
    return sum(error_score!.(data))
end

# Part 2 – autocomplete correct chunks
char_score2 = Dict(')' => 1, ']' => 2, '}' => 3, '>' => 4) # new scoring rules

# we only need to modify the outputs of `error_score` from part 1
function autocomplete!(line)
    expected_closing = Char[]
    while !isempty(line)
        c = popfirst!(line)
        if is_opening(c)
            pushfirst!(expected_closing, match_closing[c])
        else
            if c == first(expected_closing)
                popfirst!(expected_closing)
            else
                return nothing # error was found
            end
        end
    end
    return expected_closing
end

function score_completion(completion)
    score = 0
    for c in completion
        score *= 5
        score += char_score2[c]
    end
    return score
end

function solve2(::Day{10}, data)
    data = deepcopy(data) # in-place `solve2!` could comment out this line for performance
    scores = score_completion.(filter(!isnothing, autocomplete!.(data))) # filter errors
    return partialsort!(scores, div(length(scores), 2, RoundUp)) # same as `median!`
end

testresult1(::Day{10}) = 26397
testresult2(::Day{10}) = 288957
