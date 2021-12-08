# Dispatch on the day
struct Day{N} end
Day(n::Int) = Day{n}()

testdata(D::Day{N}) where {N} = load(D, @sprintf("../data/test%02d.txt", N))
data(D::Day{N}) where {N} = load(D, @sprintf("../data/data%02d.txt", N))

test1(D::Day) = solve1(D, testdata(D))
test2(D::Day) = solve2(D, testdata(D))
test1(d::Int) = test1(Day(d))
test2(d::Int) = test2(Day(d))
testresult1(d::Int) = testresult1(Day(d))
testresult2(d::Int) = testresult2(Day(d))

solve1(D::Day) = solve1(D, data(D))
solve2(D::Day) = solve2(D, data(D))
solve1(d::Int) = solve1(Day(d))
solve2(d::Int) = solve2(Day(d))
