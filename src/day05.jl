function load_d05(path)
    # Shifting indices by 1 for Julia's 1-based indexing
    return [
        [(Tuple(parse.(Int, split(t, ","))) .+ 1) for t in split(l, " -> ")] for
        l in readlines(path)
    ]
end
data_d05() = load_d05("../data/day05.txt")
test_d05() = load_d05("../data/test05.txt")

# Part 1
getx(t::NTuple{2,<:Integer}) = first(t)
gety(t::NTuple{2,<:Integer}) = last(t)
xmax(data) = maximum(maximum(getx.(line) for line in data))
ymax(data) = maximum(maximum(gety.(line) for line in data))
not_diagonal(line) = ==(getx.(line)...) || ==(gety.(line)...)
_range(a, b) = a:sign(b - a):b

function get_indices(line)
    line = sort(line)
    if not_diagonal(line)
        return CartesianIndex(line[1]):CartesianIndex(line[2])
    end
    return CartesianIndex.(_range(getx.(line)...), _range(gety.(line)...))
end

function count_overlaps(data)
    counts = zeros(Int, xmax(data), ymax(data))
    @inbounds @simd for line in data
        if not_diagonal(line)
            counts[get_indices(line)] .+= 1
        end
    end
    return sum(counts .> 1)
end

# Part 2 – we just need to remove the `not_diagonal` check
function count_overlaps2(data)
    counts = zeros(Int, xmax(data), ymax(data))
    @inbounds @simd for line in data
        counts[get_indices(line)] .+= 1
    end
    return sum(counts .> 1)
end

# Solutions computed in test_day05.jl

# # Benchmarks:
# julia> @benchmark count_overlaps($data)
# BenchmarkTools.Trial: 1623 samples with 1 evaluation.
#  Range (min … max):  2.107 ms … 11.287 ms  ┊ GC (min … max):  0.00% … 64.73%
#  Time  (median):     2.288 ms              ┊ GC (median):     0.00%
#  Time  (mean ± σ):   3.075 ms ±  1.665 ms  ┊ GC (mean ± σ):  23.04% ± 23.84%
#
#   ▅█▆▄▂▁▁                                   ▁  ▁▂▂▁
#   ███████▇▇▇▆▅▆▆▃▅▅▁▃▃▃▁▄▄▅▃▄▄▃▁▁▁▃▃▁▁▁▁▄▅▇█████████▇▄▅▆▅▁▄▆ █
#   2.11 ms      Histogram: log(frequency) by time     7.57 ms <
#
#  Memory estimate: 8.81 MiB, allocs estimate: 5345.
#
# julia> @benchmark count_overlaps2($data)
# BenchmarkTools.Trial: 1287 samples with 1 evaluation.
#  Range (min … max):  2.552 ms … 12.189 ms  ┊ GC (min … max):  0.00% … 69.54%
#  Time  (median):     2.972 ms              ┊ GC (median):     0.00%
#  Time  (mean ± σ):   3.880 ms ±  1.829 ms  ┊ GC (mean ± σ):  22.46% ± 23.65%
#
#    ▂▆█▇▃                                 ▂▂▃▁
#   ▄██████▆█▆▅▆▄▄▁▁▅▅▄▅▄▁▅▁▅▄▄▄▁▄▄▅▄▄▄▁▆▆▇████████▇▇███▆▅▅▅▅▄ █
#   2.55 ms      Histogram: log(frequency) by time     8.64 ms <
#
#  Memory estimate: 10.77 MiB, allocs estimate: 6290.
#
# julia> @benchmark data_d05()
# BenchmarkTools.Trial: 4233 samples with 1 evaluation.
#  Range (min … max):  964.754 μs …  10.646 ms  ┊ GC (min … max): 0.00% … 86.78%
#  Time  (median):       1.055 ms               ┊ GC (median):    0.00%
#  Time  (mean ± σ):     1.178 ms ± 736.530 μs  ┊ GC (mean ± σ):  7.93% ± 10.80%
#
#   ██▄▃▁                                                         ▁
#   ████████▆▅▆▆▆▆▅▅▅▅▆▄▁▁▁▁▁▃▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▆▆▇ █
#   965 μs        Histogram: log(frequency) by time       6.31 ms <
#
#  Memory estimate: 817.83 KiB, allocs estimate: 14526.
