# AdventOfCode2021.jl
<!-- Do not edit here: generated in benchmarks/generate_README.jl --->
[![Build Status](https://github.com/adrhill/AdventOfCode2021.jl/actions/workflows/CI.yml/badge.svg?branch=main)](https://github.com/adrhill/AdventOfCode2021.jl/actions/workflows/CI.yml?query=branch%3Amain)
[![Coverage](https://codecov.io/gh/adrhill/AdventOfCode2021.jl/branch/main/graph/badge.svg)](https://codecov.io/gh/adrhill/AdventOfCode2021.jl)

Solutions for the [Advent of Code 2021](https://adventofcode.com/2021) in Julia Base without dependencies.

## Benchmarks
| Day | Part | Mean time | Memory estimate | Allocs estimate|
|:---:|:----:|----------:|----------------:|---------------:|
[Day 1](https://adventofcode.com/2021/day/1)<br>[`src`](https://github.com/adrhill/AdventOfCode2021.jl/blob/main/src/day01.jl) | `load`<br>`solve1`<br>`solve2` | 404.75 μs<br>5.26 μs<br>1.79 μs | 164.89 KiB<br>15.75 KiB<br>4.55 KiB | 4028<br>1<br>3
[Day 2](https://adventofcode.com/2021/day/2)<br>[`src`](https://github.com/adrhill/AdventOfCode2021.jl/blob/main/src/day02.jl) | `load`<br>`solve1`<br>`solve2` | 636.21 μs<br>36.31 μs<br>30.09 μs | 367.86 KiB<br>8.52 KiB<br>3.73 KiB | 5043<br>544<br>238
[Day 3](https://adventofcode.com/2021/day/3)<br>[`src`](https://github.com/adrhill/AdventOfCode2021.jl/blob/main/src/day03.jl) | `load`<br>`solve1`<br>`solve2` | 275.98 μs<br>16.09 μs<br>70.31 μs | 166.17 KiB<br>3.72 KiB<br>18.73 KiB | 3032<br>63<br>226
[Day 4](https://adventofcode.com/2021/day/4)<br>[`src`](https://github.com/adrhill/AdventOfCode2021.jl/blob/main/src/day04.jl) | `load`<br>`solve1`<br>`solve2` | 599.94 μs<br>3127.00 μs<br>6235.39 μs | 285.44 KiB<br>2909.50 KiB<br>5770.05 KiB | 2634<br>37397<br>72690
[Day 5](https://adventofcode.com/2021/day/5)<br>[`src`](https://github.com/adrhill/AdventOfCode2021.jl/blob/main/src/day05.jl) | `load`<br>`solve1`<br>`solve2` | 1629.79 μs<br>4693.50 μs<br>6749.54 μs | 974.00 KiB<br>8976.03 KiB<br>10971.72 KiB | 16530<br>5345<br>6290
[Day 6](https://adventofcode.com/2021/day/6)<br>[`src`](https://github.com/adrhill/AdventOfCode2021.jl/blob/main/src/day06.jl) | `load`<br>`solve1`<br>`solve2` | 54.72 μs<br>9.21 μs<br>26.96 μs | 27.49 KiB<br>10.12 KiB<br>32.12 KiB | 29<br>81<br>257
[Day 7](https://adventofcode.com/2021/day/7)<br>[`src`](https://github.com/adrhill/AdventOfCode2021.jl/blob/main/src/day07.jl) | `load`<br>`solve1`<br>`solve2` | 149.49 μs<br>3.13 μs<br>4674.55 μs | 82.12 KiB<br>7.94 KiB<br>15541.62 KiB | 30<br>1<br>1958
[Day 8](https://adventofcode.com/2021/day/8)<br>[`src`](https://github.com/adrhill/AdventOfCode2021.jl/blob/main/src/day08.jl) | `load`<br>`solve1`<br>`solve2` | 750.49 μs<br>144.55 μs<br>4217.05 μs | 491.69 KiB<br>139.30 KiB<br>3063.55 KiB | 4428<br>1403<br>36681
[Day 9](https://adventofcode.com/2021/day/9)<br>[`src`](https://github.com/adrhill/AdventOfCode2021.jl/blob/main/src/day09.jl) | `load`<br>`solve1`<br>`solve2` | 1926.97 μs<br>162.04 μs<br>9657.35 μs | 2140.07 KiB<br>647.91 KiB<br>8292.72 KiB | 20839<br>28<br>55998
[Day 10](https://adventofcode.com/2021/day/10)<br>[`src`](https://github.com/adrhill/AdventOfCode2021.jl/blob/main/src/day10.jl) | `load`<br>`solve1`<br>`solve2` | 1529.00 μs<br>564.74 μs<br>591.56 μs | 1818.89 KiB<br>83.39 KiB<br>99.81 KiB | 20271<br>435<br>1349
[Day 11](https://adventofcode.com/2021/day/11)<br>[`src`](https://github.com/adrhill/AdventOfCode2021.jl/blob/main/src/day11.jl) | `load`<br>`solve1`<br>`solve2` | 39.83 μs<br>1275.15 μs<br>4072.40 μs | 32.75 KiB<br>1188.08 KiB<br>3768.79 KiB | 305<br>14120<br>44814