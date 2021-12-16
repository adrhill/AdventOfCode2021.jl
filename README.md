# AdventOfCode2021.jl
<!-- Do not edit here: generated in benchmarks/generate_README.jl --->
[![Build Status](https://github.com/adrhill/AdventOfCode2021.jl/actions/workflows/CI.yml/badge.svg?branch=main)](https://github.com/adrhill/AdventOfCode2021.jl/actions/workflows/CI.yml?query=branch%3Amain)
[![Coverage](https://codecov.io/gh/adrhill/AdventOfCode2021.jl/branch/main/graph/badge.svg)](https://codecov.io/gh/adrhill/AdventOfCode2021.jl)

Solutions for the [Advent of Code 2021](https://adventofcode.com/2021) in Julia Base without dependencies.

## Benchmarks
Timings may vary across commits as they are automatically generated by GitHub Actions on different machines:

| Day | Part | Mean time | Memory | Allocs |
|:---:|:----:|----------:|-------:|-------:|
[Day 1](https://adventofcode.com/2021/day/1)<br>[`src`](https://github.com/adrhill/AdventOfCode2021.jl/blob/main/src/day01.jl) | `load`<br>`solve1`<br>`solve2` | 407.09 μs<br>6.01 μs<br>1.97 μs | 164.89 KiB<br>15.75 KiB<br>4.55 KiB | 4028<br>1<br>3
[Day 2](https://adventofcode.com/2021/day/2)<br>[`src`](https://github.com/adrhill/AdventOfCode2021.jl/blob/main/src/day02.jl) | `load`<br>`solve1`<br>`solve2` | 639.07 μs<br>35.33 μs<br>30.63 μs | 367.86 KiB<br>8.52 KiB<br>3.73 KiB | 5043<br>544<br>238
[Day 3](https://adventofcode.com/2021/day/3)<br>[`src`](https://github.com/adrhill/AdventOfCode2021.jl/blob/main/src/day03.jl) | `load`<br>`solve1`<br>`solve2` | 280.34 μs<br>16.01 μs<br>71.38 μs | 166.17 KiB<br>3.72 KiB<br>18.73 KiB | 3032<br>63<br>226
[Day 4](https://adventofcode.com/2021/day/4)<br>[`src`](https://github.com/adrhill/AdventOfCode2021.jl/blob/main/src/day04.jl) | `load`<br>`solve1`<br>`solve2` | 601.48 μs<br>3115.35 μs<br>6178.69 μs | 285.44 KiB<br>2909.50 KiB<br>5770.05 KiB | 2634<br>37397<br>72690
[Day 5](https://adventofcode.com/2021/day/5)<br>[`src`](https://github.com/adrhill/AdventOfCode2021.jl/blob/main/src/day05.jl) | `load`<br>`solve1`<br>`solve2` | 1685.79 μs<br>4755.19 μs<br>6879.48 μs | 974.00 KiB<br>8976.03 KiB<br>10971.72 KiB | 16530<br>5345<br>6290
[Day 6](https://adventofcode.com/2021/day/6)<br>[`src`](https://github.com/adrhill/AdventOfCode2021.jl/blob/main/src/day06.jl) | `load`<br>`solve1`<br>`solve2` | 51.14 μs<br>9.43 μs<br>27.14 μs | 27.49 KiB<br>10.12 KiB<br>32.12 KiB | 29<br>81<br>257
[Day 7](https://adventofcode.com/2021/day/7)<br>[`src`](https://github.com/adrhill/AdventOfCode2021.jl/blob/main/src/day07.jl) | `load`<br>`solve1`<br>`solve2` | 150.27 μs<br>2.99 μs<br>4315.19 μs | 82.12 KiB<br>7.94 KiB<br>15541.62 KiB | 30<br>1<br>1958
[Day 8](https://adventofcode.com/2021/day/8)<br>[`src`](https://github.com/adrhill/AdventOfCode2021.jl/blob/main/src/day08.jl) | `load`<br>`solve1`<br>`solve2` | 770.40 μs<br>147.63 μs<br>4361.92 μs | 491.69 KiB<br>139.30 KiB<br>3063.55 KiB | 4428<br>1403<br>36681
[Day 9](https://adventofcode.com/2021/day/9)<br>[`src`](https://github.com/adrhill/AdventOfCode2021.jl/blob/main/src/day09.jl) | `load`<br>`solve1`<br>`solve2` | 1962.39 μs<br>157.33 μs<br>9799.62 μs | 2140.07 KiB<br>647.91 KiB<br>8292.72 KiB | 20839<br>28<br>55998
[Day 10](https://adventofcode.com/2021/day/10)<br>[`src`](https://github.com/adrhill/AdventOfCode2021.jl/blob/main/src/day10.jl) | `load`<br>`solve1`<br>`solve2` | 1554.62 μs<br>531.11 μs<br>599.06 μs | 1818.89 KiB<br>83.39 KiB<br>99.81 KiB | 20271<br>435<br>1349
[Day 11](https://adventofcode.com/2021/day/11)<br>[`src`](https://github.com/adrhill/AdventOfCode2021.jl/blob/main/src/day11.jl) | `load`<br>`solve1`<br>`solve2` | 40.70 μs<br>1302.18 μs<br>4181.25 μs | 32.75 KiB<br>1188.08 KiB<br>3768.79 KiB | 305<br>14120<br>44814
[Day 12](https://adventofcode.com/2021/day/12)<br>[`src`](https://github.com/adrhill/AdventOfCode2021.jl/blob/main/src/day12.jl) | `load`<br>`solve1`<br>`solve2` | 20.75 μs<br>19841.02 μs<br>928725.57 μs | 9.19 KiB<br>14412.42 KiB<br>559774.62 KiB | 114<br>252595<br>13321828
[Day 13](https://adventofcode.com/2021/day/13)<br>[`src`](https://github.com/adrhill/AdventOfCode2021.jl/blob/main/src/day13.jl) | `load`<br>`solve1`<br>`solve2` | 809.76 μs<br>9.25 μs<br>203.15 μs | 511.89 KiB<br>3.50 KiB<br>58.20 KiB | 7266<br>104<br>1641
[Day 14](https://adventofcode.com/2021/day/14)<br>[`src`](https://github.com/adrhill/AdventOfCode2021.jl/blob/main/src/day14.jl) | `load`<br>`solve1`<br>`solve2` | 133.63 μs<br>221.77 μs<br>1060.50 μs | 106.12 KiB<br>135.20 KiB<br>625.52 KiB | 1209<br>1315<br>6415
[Day 15](https://adventofcode.com/2021/day/15)<br>[`src`](https://github.com/adrhill/AdventOfCode2021.jl/blob/main/src/day15.jl) | `load`<br>`solve1`<br>`solve2` | 1819.59 μs<br>17016.56 μs<br>1776713.45 μs | 2218.24 KiB<br>19335.34 KiB<br>1780413.16 KiB | 20841<br>19874<br>499894
[Day 16](https://adventofcode.com/2021/day/16)<br>[`src`](https://github.com/adrhill/AdventOfCode2021.jl/blob/main/src/day16.jl) | `load`<br>`solve1`<br>`solve2` | 422.38 μs<br>336.45 μs<br>339.22 μs | 445.04 KiB<br>305.95 KiB<br>305.95 KiB | 6865<br>3486<br>3486