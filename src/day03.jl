function data_d03()
    return BitMatrix(
        permutedims(
            reduce(hcat, [[c == '1' for c in line] for line in readlines("../data/day03.txt")])
        ),
    )
end

# Part 1
@inline bv2int(bv::BitVector) = parse(Int, join(convert(Vector{Int}, bv)); base=2)

function power_consumption(A::BitMatrix)
    bv = sum.(eachcol(A)) .>= div(size(A, 1), 2, RoundUp)
    return bv2int(bv) * bv2int(.!bv) # ε * γ
end

# Part 2
@inline mostcommon(v::BitVector) = sum(v) >= div(length(v), 2, RoundUp)

function oxygen_generator_rating(A::BitMatrix)
    A = copy(A)
    bitpos = 1
    while size(A, 1) > 1
        mc = mostcommon(A[:, bitpos])
        A = A[A[:, bitpos] .== mc, :]
        bitpos += 1
    end
    return bv2int(A[1, :])
end

function co2_scrubber_rating(A::BitMatrix)
    A = copy(A)
    bitpos = 1
    while size(A, 1) > 1
        lc = !mostcommon(A[:, bitpos])
        A = A[A[:, bitpos] .== lc, :]
        bitpos += 1
    end
    return bv2int(A[1, :])
end

life_support_rating(A::BitMatrix) = oxygen_generator_rating(A) * co2_scrubber_rating(A)

# Solutions computed in test_day03.jl

# # Some benchmarks for Part 2:
# ```julia-repl
# julia> @benchmark data = data_d03()
# BenchmarkTools.Trial:
#   memory estimate:  165.38 KiB
#   allocs estimate:  3023
#   --------------
#   minimum time:     158.350 μs (0.00% GC)
#   median time:      165.948 μs (0.00% GC)
#   mean time:        190.962 μs (9.47% GC)
#   maximum time:     7.465 ms (96.74% GC)
#   --------------
#   samples:          10000
#   evals/sample:     1

# julia> @benchmark life_support_rating($data)
# BenchmarkTools.Trial:
#   memory estimate:  18.73 KiB
#   allocs estimate:  226
#   --------------
#   minimum time:     38.576 μs (0.00% GC)
#   median time:      40.289 μs (0.00% GC)
#   mean time:        44.369 μs (3.35% GC)
#   maximum time:     5.052 ms (98.87% GC)
#   --------------
#   samples:          10000
#   evals/sample:     1
# ```
