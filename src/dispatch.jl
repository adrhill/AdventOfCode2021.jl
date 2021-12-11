# Dispatch on the day
struct Day{N} end
Day(n::Int) = Day{n}()

function testdata(D::Day{N}) where {N}
    return load(D, joinpath(@__DIR__, "..", "data", @sprintf("test%02d.txt", N)))
end
function data(D::Day{N}) where {N}
    return load(D, joinpath(@__DIR__, "..", "data", @sprintf("data%02d.txt", N)))
end

test1(D::Day) = solve1(D, testdata(D))
test2(D::Day) = solve2(D, testdata(D))

solve1(D::Day) = solve1(D, data(D))
solve2(D::Day) = solve2(D, data(D))
