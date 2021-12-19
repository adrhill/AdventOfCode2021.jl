# AdventOfCode2021.jl
<!-- Do not edit here: generated in benchmarks/generate_README.jl --->
[![Build Status](https://github.com/adrhill/AdventOfCode2021.jl/actions/workflows/CI.yml/badge.svg?branch=main)](https://github.com/adrhill/AdventOfCode2021.jl/actions/workflows/CI.yml?query=branch%3Amain)
[![Coverage](https://codecov.io/gh/adrhill/AdventOfCode2021.jl/branch/main/graph/badge.svg)](https://codecov.io/gh/adrhill/AdventOfCode2021.jl)

Solutions for the [Advent of Code 2021](https://adventofcode.com/2021) in Julia Base without dependencies.

## Benchmarks
Timings may vary across commits as they are automatically generated by GitHub Actions on different machines:

| Day | Part | Mean time | Memory | Allocs |
|:---:|:----:|----------:|-------:|-------:|
[Day 1](https://adventofcode.com/2021/day/1)<br>[`src`](https://github.com/adrhill/AdventOfCode2021.jl/blob/main/src/day01.jl) | `load`<br>`solve1`<br>`solve2` | 484.78 μs<br>7.23 μs<br>3.04 μs | 164.89 KiB<br>15.75 KiB<br>4.55 KiB | 4028<br>1<br>3
[Day 2](https://adventofcode.com/2021/day/2)<br>[`src`](https://github.com/adrhill/AdventOfCode2021.jl/blob/main/src/day02.jl) | `load`<br>`solve1`<br>`solve2` | 832.99 μs<br>40.63 μs<br>33.70 μs | 367.86 KiB<br>8.52 KiB<br>3.73 KiB | 5043<br>544<br>238
[Day 3](https://adventofcode.com/2021/day/3)<br>[`src`](https://github.com/adrhill/AdventOfCode2021.jl/blob/main/src/day03.jl) | `load`<br>`solve1`<br>`solve2` | 337.62 μs<br>17.86 μs<br>88.29 μs | 166.17 KiB<br>3.72 KiB<br>18.73 KiB | 3032<br>63<br>226
[Day 4](https://adventofcode.com/2021/day/4)<br>[`src`](https://github.com/adrhill/AdventOfCode2021.jl/blob/main/src/day04.jl) | `load`<br>`solve1`<br>`solve2` | 668.83 μs<br>3630.70 μs<br>7445.31 μs | 285.44 KiB<br>2909.50 KiB<br>5770.05 KiB | 2634<br>37397<br>72690
[Day 5](https://adventofcode.com/2021/day/5)<br>[`src`](https://github.com/adrhill/AdventOfCode2021.jl/blob/main/src/day05.jl) | `load`<br>`solve1`<br>`solve2` | 2075.67 μs<br>3659.69 μs<br>5671.19 μs | 974.00 KiB<br>8976.03 KiB<br>10971.72 KiB | 16530<br>5345<br>6290
[Day 6](https://adventofcode.com/2021/day/6)<br>[`src`](https://github.com/adrhill/AdventOfCode2021.jl/blob/main/src/day06.jl) | `load`<br>`solve1`<br>`solve2` | 67.79 μs<br>11.32 μs<br>33.14 μs | 27.49 KiB<br>10.12 KiB<br>32.12 KiB | 29<br>81<br>257
[Day 7](https://adventofcode.com/2021/day/7)<br>[`src`](https://github.com/adrhill/AdventOfCode2021.jl/blob/main/src/day07.jl) | `load`<br>`solve1`<br>`solve2` | 181.87 μs<br>4.43 μs<br>10102.04 μs | 82.12 KiB<br>7.94 KiB<br>15541.62 KiB | 30<br>1<br>1958
[Day 8](https://adventofcode.com/2021/day/8)<br>[`src`](https://github.com/adrhill/AdventOfCode2021.jl/blob/main/src/day08.jl) | `load`<br>`solve1`<br>`solve2` | 1050.85 μs<br>161.28 μs<br>5106.65 μs | 491.69 KiB<br>139.30 KiB<br>3063.55 KiB | 4428<br>1403<br>36681
[Day 9](https://adventofcode.com/2021/day/9)<br>[`src`](https://github.com/adrhill/AdventOfCode2021.jl/blob/main/src/day09.jl) | `load`<br>`solve1`<br>`solve2` | 2263.85 μs<br>174.81 μs<br>10308.68 μs | 2140.07 KiB<br>647.91 KiB<br>8292.72 KiB | 20839<br>28<br>55998
[Day 10](https://adventofcode.com/2021/day/10)<br>[`src`](https://github.com/adrhill/AdventOfCode2021.jl/blob/main/src/day10.jl) | `load`<br>`solve1`<br>`solve2` | 1723.47 μs<br>673.62 μs<br>676.15 μs | 1818.89 KiB<br>83.39 KiB<br>99.81 KiB | 20271<br>435<br>1349
[Day 11](https://adventofcode.com/2021/day/11)<br>[`src`](https://github.com/adrhill/AdventOfCode2021.jl/blob/main/src/day11.jl) | `load`<br>`solve1`<br>`solve2` | 57.49 μs<br>1588.37 μs<br>4916.41 μs | 32.75 KiB<br>1188.08 KiB<br>3768.79 KiB | 305<br>14120<br>44814
[Day 12](https://adventofcode.com/2021/day/12)<br>[`src`](https://github.com/adrhill/AdventOfCode2021.jl/blob/main/src/day12.jl) | `load`<br>`solve1`<br>`solve2` | 26.31 μs<br>22494.45 μs<br>994791.35 μs | 9.19 KiB<br>14412.42 KiB<br>559774.62 KiB | 114<br>252595<br>13321828
[Day 13](https://adventofcode.com/2021/day/13)<br>[`src`](https://github.com/adrhill/AdventOfCode2021.jl/blob/main/src/day13.jl) | `load`<br>`solve1`<br>`solve2` | 1016.40 μs<br>10.72 μs<br>115.36 μs | 511.89 KiB<br>3.50 KiB<br>42.00 KiB | 7266<br>104<br>1248
[Day 14](https://adventofcode.com/2021/day/14)<br>[`src`](https://github.com/adrhill/AdventOfCode2021.jl/blob/main/src/day14.jl) | `load`<br>`solve1`<br>`solve2` | 167.22 μs<br>267.66 μs<br>1229.38 μs | 106.12 KiB<br>135.20 KiB<br>625.52 KiB | 1209<br>1315<br>6415
[Day 15](https://adventofcode.com/2021/day/15)<br>[`src`](https://github.com/adrhill/AdventOfCode2021.jl/blob/main/src/day15.jl) | `load`<br>`solve1`<br>`solve2` | 2156.55 μs<br>20257.53 μs<br>2130211.61 μs | 2218.24 KiB<br>19335.34 KiB<br>1780413.16 KiB | 20841<br>19874<br>499894
[Day 16](https://adventofcode.com/2021/day/16)<br>[`src`](https://github.com/adrhill/AdventOfCode2021.jl/blob/main/src/day16.jl) | `load`<br>`solve1`<br>`solve2` | 488.54 μs<br>404.72 μs<br>398.11 μs | 445.04 KiB<br>305.95 KiB<br>305.95 KiB | 6865<br>3486<br>3486
[Day 17](https://adventofcode.com/2021/day/17)<br>[`src`](https://github.com/adrhill/AdventOfCode2021.jl/blob/main/src/day17.jl) | `load`<br>`solve1`<br>`solve2` | 12.38 μs<br>203.91 μs<br>8158.86 μs | 2.14 KiB<br>245.55 KiB<br>7982.41 KiB | 30<br>153<br>54545
[Day 18](https://adventofcode.com/2021/day/18)<br>[`src`](https://github.com/adrhill/AdventOfCode2021.jl/blob/main/src/day18.jl) | `load`<br>`solve1`<br>`solve2` | 44722.47 μs<br>2968.80 μs<br>414319.42 μs | 533.91 KiB<br>390.78 KiB<br>19820.12 KiB | 10612<br>9331<br>326158