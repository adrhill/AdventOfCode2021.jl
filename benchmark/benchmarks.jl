using BenchmarkTools
using AdventOfCode2021

on_CI = haskey(ENV, "GITHUB_ACTIONS")

SUITE = BenchmarkGroup()
for day in 1:CURRENT_DAY
    groupname = @sprintf("Day %02d", day)
    Day = Day(day)
    SUITE[groupname] = BenchmarkGroup(["load data", "solve1", "solve2"])
    SUITE[groupname]["load data"] = @benchmarkable(data(Day))
    data = data(Day)
    SUITE[groupname]["solve1"] = @benchmarkable(solve1(Day), $data)
    SUITE[groupname]["solve2"] = @benchmarkable(solve2(Day), $data)
end
