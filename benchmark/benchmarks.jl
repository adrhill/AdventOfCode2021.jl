using AdventOfCode2021
using BenchmarkTools

TUNE = true

SUITE = BenchmarkGroup()
for day in 1:CURRENT_DAY
    _Day = Day(day)
    SUITE["$day"] = BenchmarkGroup(["load", "solve1", "solve2"])
    SUITE["$day"]["1"] = @benchmarkable data($_Day)
    _data = data(_Day)
    SUITE["$day"]["solve1"] = @benchmarkable solve1($_Day, $_data)
    SUITE["$day"]["solve2"] = @benchmarkable solve2($_Day, $_data)
end
