data_d01() = parse.(Int, (readlines("../data/day01.txt")))

# Part 1
count_increases(A::AbstractVector{<:Integer}) = sum(x -> x > 0, diff(A))

# Part 2: naive implementation
function windowed_sums(A::AbstractVector{<:Integer}; window=3)
    nout = length(A) - window + 1
    wsums = similar(A, nout)
    for i in 1:nout
        wsums[i] = sum(A[i:(i + window - 1)])
    end
    return wsums
end

# Part 2: ignoring identical summands in window
function windowed_count_increases(A::AbstractVector{<:Integer}; window=3)
    n = length(A)
    return sum(view(A, (1 + window):n) .> view(A, 1:(n - window)))
end

# Solutions computed in test_day01.jl
