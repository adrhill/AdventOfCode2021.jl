function load(::Day{3}, path)
    return BitMatrix(
        permutedims(reduce(hcat, [[c == '1' for c in line] for line in readlines(path)]))
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

solve1(::Day{3}, data) = power_consumption(data)
solve2(::Day{3}, data) = life_support_rating(data)

testresult1(::Day{3}) = 198
testresult2(::Day{3}) = 230
