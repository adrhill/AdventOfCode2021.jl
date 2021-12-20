# Day 20: Trench Map
# Image is permuted for faster iteration
function load(::Day{20}, path)
    # function load(path)
    lines = readlines(path)
    alg = [c == '#' for c in lines[1]]
    img = BitMatrix(reduce(hcat, [[c == '#' for c in line] for line in lines[3:end]]))
    return alg, img
end

# Part 1 – count pixels in output image
# Offsets defining neighborhood. We need to "read across each column":
const CONV_OFFSETS = [
    CartesianIndex(-1, -1),
    CartesianIndex(0, -1),
    CartesianIndex(1, -1),
    CartesianIndex(-1, 0),
    CartesianIndex(0, 0),
    CartesianIndex(1, 0),
    CartesianIndex(-1, 1),
    CartesianIndex(0, 1),
    CartesianIndex(1, 1),
]

function pad_image(img; px=1, val=false)
    h, w = size(img)
    padrows = zeros(Bool, px, w)
    padcols = zeros(Bool, h + 2 * px, px)
    return hcat(padcols, vcat(padrows, img, padrows), padcols)
end

@inline getval(img, I::CartesianIndex, outer) = checkbounds(Bool, img, I) ? img[I] : outer

const POWS = 2 .^ collect(8:-1:0)
@inline neighbors2num(n) = sum(POWS .* n) + 1

function apply_algorithm!(out, img, outer, alg)
    @inbounds @simd for I in CartesianIndices(img) # not sure @simd does anything here...
        # Index the value of the algorithm `alg` based on the binary number
        # that results from the neighboring pixels.
        out[I] = alg[neighbors2num([
            getval(img, I + offset, outer) for offset in CONV_OFFSETS
        ])]
    end
    return out
end

function enhance_n_times(alg, img, n)
    img = pad_image(img; px=n)
    buff = similar(img)
    outer = false

    for _ in 1:n
        img .= apply_algorithm!(buff, img, outer, alg)
        # The "outer values" are flashing if `alg[1] = 1` and `alg[end] = 0`
        alg[1] == 1 && (outer = !outer)
    end
    return img
end

solve1(::Day{20}, data) = sum(enhance_n_times(data..., 2))

# Part 2 – Part 1 with more steps
solve2(::Day{20}, data) = sum(enhance_n_times(data..., 50))

testresult1(::Day{20}) = 35
testresult2(::Day{20}) = 3351
