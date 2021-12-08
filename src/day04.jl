parse_board(b) = parse.(Int, (reduce(hcat, split.(b, " "; keepempty=false))))
function load(::Day{4}, path)
    lines = readlines(path)
    draws = parse.(Int, split(lines[1], ","))
    boards = [parse_board(lines[i:(i + 4)]) for i in 3:6:(length(lines) - 4)]
    return draws, boards
end

# Part 1
@inline is_win(check) = is_win_col(check) || is_win_row(check)
@inline is_win_col(check) = any(sum.(eachcol(check)) .== 5)
@inline is_win_row(check) = any(sum.(eachrow(check)) .== 5)

# Score board without multiplying by draw. Return 0 if not won.
@inline score(board, check) = is_win(check) ? sum(board[.!check]) : 0

# We don't really need any error-handling as the there are 100 draws,
# so the end of the game is guaranteed for any player
function solve1(::Day{4}, data) # winning score
    draws, boards = data
    checks = [zeros(Bool, 5, 5) for i in 1:length(boards)]
    @inbounds for draw in draws
        scores = map(zip(boards, checks)) do (b, c)
            c[findall(n -> n == draw, b)] .= true
            score(b, c)
        end
        if any(scores .> 0)
            return maximum(scores) * draw
        end
    end
end

# Part 2
# Luckily, we don't need to find the index of the board, just its score.
function solve2(::Day{4}, data) # last score
    draws, boards = data
    checks = [zeros(Bool, 5, 5) for i in 1:length(boards)]
    @inbounds for draw in draws
        scores = map(zip(boards, checks)) do (b, c)
            c[findall(n -> n == draw, b)] .= true
            score(b, c)
        end
        if all(scores .> 0)
            return minimum(scores) * draw
        else
            keep = findall(iszero, scores)
            boards = boards[keep]
            checks = checks[keep]
        end
    end
end

testresult1(::Day{4}) = 4512
testresult2(::Day{4}) = 1924
