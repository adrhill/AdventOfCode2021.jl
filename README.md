# AdventOfCode2021.jl
<!-- Do not edit here: generated in benchmarks/generate_README.jl --->
[![Build Status](https://github.com/adrhill/AdventOfCode2021.jl/actions/workflows/CI.yml/badge.svg?branch=main)](https://github.com/adrhill/AdventOfCode2021.jl/actions/workflows/CI.yml?query=branch%3Amain)
[![Coverage](https://codecov.io/gh/adrhill/AdventOfCode2021.jl/branch/main/graph/badge.svg)](https://codecov.io/gh/adrhill/AdventOfCode2021.jl)

Solutions for the [Advent of Code 2021](https://adventofcode.com/2021) in Julia Base without dependencies.

## Benchmarks
| Day | Part | Mean time | Memory est. | Allocs est.|
|:---:|:----:|----------:|------------:|-----------:|
[Task 1](https://adventofcode.com/2021/day/1)<br>([`src`](https://github.com/adrhill/AdventOfCode2021.jl/blob/main/src/day01.jl)) | `load`<br>`solve1`<br>`solve2` | 311.96 μs<br>3.72 μs<br>2.31 μs | 143.55 KiB<br>15.75 KiB<br>4.55 KiB | 4035<br>1<br>3
[Task 2](https://adventofcode.com/2021/day/2)<br>([`src`](https://github.com/adrhill/AdventOfCode2021.jl/blob/main/src/day02.jl)) | `load`<br>`solve1`<br>`solve2` | 437.97 μs<br>26.11 μs<br>23.62 μs | 284.14 KiB<br>8.52 KiB<br>3.73 KiB | 5043<br>544<br>238
[Task 3](https://adventofcode.com/2021/day/3)<br>([`src`](https://github.com/adrhill/AdventOfCode2021.jl/blob/main/src/day03.jl)) | `load`<br>`solve1`<br>`solve2` | 221.72 μs<br>12.04 μs<br>63.44 μs | 192.11 KiB<br>3.88 KiB<br>20.92 KiB | 3039<br>65<br>228
[Task 4](https://adventofcode.com/2021/day/4)<br>([`src`](https://github.com/adrhill/AdventOfCode2021.jl/blob/main/src/day04.jl)) | `load`<br>`solve1`<br>`solve2` | 446.48 μs<br>1362.88 μs<br>2806.48 μs | 371.80 KiB<br>2925.98 KiB<br>5893.16 KiB | 3045<br>23457<br>46105
[Task 5](https://adventofcode.com/2021/day/5)<br>([`src`](https://github.com/adrhill/AdventOfCode2021.jl/blob/main/src/day05.jl)) | `load`<br>`solve1`<br>`solve2` | 1225.14 μs<br>4170.78 μs<br>5580.47 μs | 818.69 KiB<br>9026.09 KiB<br>11025.89 KiB | 14537<br>5345<br>6290
[Task 6](https://adventofcode.com/2021/day/6)<br>([`src`](https://github.com/adrhill/AdventOfCode2021.jl/blob/main/src/day06.jl)) | `load`<br>`solve1`<br>`solve2` | 52.76 μs<br>5.06 μs<br>16.14 μs | 29.90 KiB<br>11.41 KiB<br>36.16 KiB | 36<br>81<br>257
[Task 7](https://adventofcode.com/2021/day/7)<br>([`src`](https://github.com/adrhill/AdventOfCode2021.jl/blob/main/src/day07.jl)) | `load`<br>`solve1`<br>`solve2` | 129.22 μs<br>2.50 μs<br>4298.34 μs | 65.84 KiB<br>7.94 KiB<br>15541.62 KiB | 37<br>1<br>1958
[Task 8](https://adventofcode.com/2021/day/8)<br>([`src`](https://github.com/adrhill/AdventOfCode2021.jl/blob/main/src/day08.jl)) | `load`<br>`solve1`<br>`solve2` | 461.53 μs<br>86.14 μs<br>2715.57 μs | 407.35 KiB<br>164.30 KiB<br>3684.03 KiB | 4634<br>1403<br>37079
[Task 9](https://adventofcode.com/2021/day/9)<br>([`src`](https://github.com/adrhill/AdventOfCode2021.jl/blob/main/src/day09.jl)) | `load`<br>`solve1`<br>`solve2` | 1274.67 μs<br>106.98 μs<br>5078.65 μs | 2220.32 KiB<br>648.16 KiB<br>9204.66 KiB | 21145<br>28<br>55998
[Task 10](https://adventofcode.com/2021/day/10)<br>([`src`](https://github.com/adrhill/AdventOfCode2021.jl/blob/main/src/day10.jl)) | `load`<br>`solve1`<br>`solve2` | 960.14 μs<br>416.51 μs<br>460.83 μs | 1899.97 KiB<br>83.03 KiB<br>99.92 KiB | 20570<br>631<br>1555
[Task 11](https://adventofcode.com/2021/day/11)<br>([`src`](https://github.com/adrhill/AdventOfCode2021.jl/blob/main/src/day11.jl)) | `load`<br>`solve1`<br>`solve2` | 39.25 μs<br>869.23 μs<br>2791.37 μs | 28.16 KiB<br>1442.77 KiB<br>4561.57 KiB | 319<br>13990<br>44165