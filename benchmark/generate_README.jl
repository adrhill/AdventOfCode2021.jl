using AdventOfCode2021
using BenchmarkTools
using Printf

on_CI = haskey(ENV, "GITHUB_ACTIONS")
if on_CI
    tune = true
else
    # Select if benchmarks should be re-tuned when run locally
    tune = false
end

# Set up benchmarking suite
suite = BenchmarkGroup()
for day in 1:CURRENT_DAY
    _Day = Day(day)
    suite["$day"] = BenchmarkGroup(["load", "solve1", "solve2"])
    suite["$day"]["load"] = @benchmarkable data($_Day)
    _data = data(_Day)
    suite["$day"]["solve1"] = @benchmarkable solve1($_Day, $_data)
    suite["$day"]["solve2"] = @benchmarkable solve2($_Day, $_data)
end

loadparams!(suite, BenchmarkTools.load("benchmark/params.json")[1], :evals, :samples);

# Re-tune if selected
if tune
    print("Tuning benchmark suite... ")
    tune!(suite)
    BenchmarkTools.save("benchmark/params.json", params(suite))
    println("params saved.")
end

# Run bechmarks
println("Running benchmarks... ")
results = run(suite; verbose=true)

# Parse results to table-rows for readme
formattime(t) = @sprintf "%.2f μs" t / 1000 # where t = time in ns
formatmemory(m) = @sprintf "%.2f KiB" m / 1024 # where m = memory in bytes

function day2string(day::Integer)
    two_digit_day = @sprintf "%02d" day

    # Some hand-crafted strings
    url_task = "https://adventofcode.com/2021/day/$day"
    url_src = "https://github.com/adrhill/AdventOfCode2021.jl/blob/main/src/day$two_digit_day.jl"
    day_string = """[Day $day]($url_task)<br>[`src`]($url_src)"""
    functions_string = "`load`<br>`solve1`<br>`solve2`"

    # Strings from benchmarks
    res = results["$day"]
    ks = ["load", "solve1", "solve2"]
    times = join([formattime(mean(res[k]).time) for k in ks], "<br>")
    mems = join([formatmemory(mean(res[k]).memory) for k in ks], "<br>")
    allocs = join([mean(res[k]).allocs for k in ks], "<br>")
    return join([day_string, functions_string, times, mems, allocs], " | ")
end

# Handwritten README stuff
ci_badge = "https://github.com/adrhill/AdventOfCode2021.jl/actions/workflows/CI.yml/badge.svg?branch=main"
ci_url = "https://github.com/adrhill/AdventOfCode2021.jl/actions/workflows/CI.yml?query=branch%3Amain"
cov_badge = "https://codecov.io/gh/adrhill/AdventOfCode2021.jl/branch/main/graph/badge.svg"
cov_url = "https://codecov.io/gh/adrhill/AdventOfCode2021.jl"
readme_header = """
# AdventOfCode2021.jl
<!-- Do not edit here: generated in benchmarks/generate_README.jl --->
[![Build Status]($ci_badge)]($ci_url)
[![Coverage]($cov_badge)]($cov_url)

Solutions for the [Advent of Code 2021](https://adventofcode.com/2021) in Julia Base without dependencies.

## Benchmarks
| Day | Part | Mean time | Memory estimate | Allocs estimate|
|:---:|:----:|----------:|----------------:|---------------:|"""

# Write table to file
open(joinpath(@__DIR__, "..", "README.md"), "w") do io
    write(io, join([readme_header, [day2string(d) for d in 1:CURRENT_DAY]...], "\n"))
end;
