data_d06() = parse.(Int, split(readline("../data/day06.txt"), ","))

# Part 1
function count_lanternfish(init_fish, days)
    counts = map(i -> count(==(i), init_fish), 0:8)
    for i in 1:days
        # Keep Julia's 1-based indexing in mind:
        # counts[1] = fish with 0 days left to live
        born = counts[1]
        counts[1:(end - 1)] .= counts[2:end]
        counts[7] += born
        counts[9] = born
    end
    return sum(counts)
end

# Part 2 uses the same code
# Solutions computed in test_day06.jl

# Benchmarks:
# ```julia-repl
# julia> @benchmark data_d06()
# BenchmarkTools.Trial:
#   memory estimate:  26.70 KiB
#   allocs estimate:  20
#   --------------
#   minimum time:     32.165 μs (0.00% GC)
#   median time:      36.236 μs (0.00% GC)
#   mean time:        41.373 μs (5.78% GC)
#   maximum time:     12.726 ms (96.18% GC)
#   --------------
#   samples:          10000
#   evals/sample:     1
#
# julia> @benchmark count_lanternfish($data, $80)
# BenchmarkTools.Trial:
#   memory estimate:  10.12 KiB
#   allocs estimate:  81
#   --------------
#   minimum time:     3.421 μs (0.00% GC)
#   median time:      3.993 μs (0.00% GC)
#   mean time:        4.923 μs (14.73% GC)
#   maximum time:     1.283 ms (99.48% GC)
#   --------------
#   samples:          10000
#   evals/sample:     8
#
# julia> @benchmark count_lanternfish($data, $256)
# BenchmarkTools.Trial:
# memory estimate:  32.12 KiB
# allocs estimate:  257
# --------------
# minimum time:     10.442 μs (0.00% GC)
# median time:      12.509 μs (0.00% GC)
# mean time:        15.791 μs (11.70% GC)
# maximum time:     10.442 ms (99.69% GC)
# --------------
# samples:          10000
# evals/sample:     1
# ```
