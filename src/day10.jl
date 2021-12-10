# Day 10: Syntax Scoring
# I'm out of my comfort zone here, so everything is naively implemented!

load(::Day{10}, path) = [first.(l) for l in split.(readlines(path), "")]

# Part 1 – find corrupted codes: lines where a chunk closes with the wrong character
char_score = Dict(')' => 3, ']' => 57, '}' => 1197, '>' => 25137)
match_opening = Dict(')' => '(', ']' => '[', '}' => '{', '>' => '<')
match_closing = Dict(v => k for (k, v) in match_opening)

is_opening(c::Char) = c in "([{<"

function error_score(line)
    open_chunks = [popfirst!(line)]
    while !isempty(line)
        c = popfirst!(line)
        if is_opening(c)
            push!(open_chunks, c)
        else
            if match_opening[c] == open_chunks[end] # found char matches expected
                pop!(open_chunks)
            else
                return char_score[c]
            end
        end
    end
    return 0 # zero error score if no error was found
end

solve1(::Day{10}, data) = sum(error_score.(data))

# Part 2 – autocomplete correct chunks
char_score2 = Dict(')' => 1, ']' => 2, '}' => 3, '>' => 4) # new scoring rules

# we only need to modify `error_score` from part 1
function autocomplete(line)
    open_chunks = [popfirst!(line)]
    while !isempty(line)
        c = popfirst!(line)
        if is_opening(c)
            push!(open_chunks, c)
        else
            if match_opening[c] == open_chunks[end]
                pop!(open_chunks)
            else
                return nothing # error was found
            end
        end
    end
    return reverse(map(c -> match_closing[c], open_chunks))
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
    scores = score_completion.(filter(!isnothing, autocomplete.(data))) # filter errors
    return partialsort!(scores, div(length(scores), 2, RoundUp))
end

testresult1(::Day{10}) = 26397
testresult2(::Day{10}) = 288957
