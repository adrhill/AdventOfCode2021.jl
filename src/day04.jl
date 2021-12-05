function parse_board(b)
    return reduce(
        hcat, [[parse(Int, num) for num in split(ln, " "; keepempty=false)] for ln in b]
    )
end
function load_d04(path)
    lines = readlines(path)
    draws = parse.(Int, split(lines[1], ","))
    boards = [parse_board(lines[i:(i + 4)]) for i in 3:6:(length(lines) - 4)]
    return draws, boards
end
data_d04() = load_d04("../data/day04.txt")
test_d04() = load_d04("../data/test04.txt")

# Part 1
@inline is_win(check) = is_win_col(check) || is_win_row(check)
@inline is_win_col(check) = any(sum.(eachcol(check)) .== 5)
@inline is_win_row(check) = any(sum.(eachrow(check)) .== 5)

# Score board without multiplying by draw. Return 0 if not won.
@inline score(board, check) = is_win(check) ? sum(board[.!check]) : 0

# We don't really need any error-handling as the there are 100 draws,
# so the end of the game is guaranteed for any player
function winning_score(draws, boards)
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
function last_score(draws, boards)
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

# Solutions computed in test_day04.jl

# # Benchmarks:
# julia> @benchmark winning_score($draws, $boards)
# BenchmarkTools.Trial: 3596 samples with 1 evaluation.
#  Range (min … max):  905.567 μs …   5.871 ms  ┊ GC (min … max):  0.00% … 77.33%
#  Time  (median):       1.185 ms               ┊ GC (median):     0.00%
#  Time  (mean ± σ):     1.386 ms ± 831.014 μs  ┊ GC (mean ± σ):  15.76% ± 18.34%
#
#   ▂▃▄▅█▅▁                                                    ▁  ▁
#   ███████▅▄▄▅▅▅▁▁▁▁▃▁▃▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▃▅▆▇▇▇▆▆████ █
#   906 μs        Histogram: log(frequency) by time       4.69 ms <
#
#  Memory estimate: 2.86 MiB, allocs estimate: 23457.
#
# julia> @benchmark last_score($draws, $boards)
# BenchmarkTools.Trial: 1633 samples with 1 evaluation.
#  Range (min … max):  2.083 ms … 8.649 ms  ┊ GC (min … max):  0.00% … 67.02%
#  Time  (median):     2.537 ms             ┊ GC (median):     0.00%
#  Time  (mean ± σ):   3.052 ms ± 1.329 ms  ┊ GC (mean ± σ):  16.54% ± 20.25%
#
#      ▅██▆▃                                      ▁▂▁   ▁
#   ▄▁▆███████▅▄▁▅▄▄▄▁▁▁▄▄▁▄▁▄▄▅▄▁▁▁▁▁▁▁▁▁▁▁▁▁▄▄▄▇███████▇█▇▇ █
#   2.08 ms     Histogram: log(frequency) by time     6.93 ms <
#
#  Memory estimate: 5.76 MiB, allocs estimate: 46105.
