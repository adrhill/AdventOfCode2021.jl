using AdventOfCode2021
using Test

@testset "AdventOfCode2021" begin
    @testset "Day 01" begin
        include("test_day01.jl")
    end
    @testset "Day 02" begin
        include("test_day02.jl")
    end
    @testset "Day 03" begin
        include("test_day03.jl")
    end
    @testset "Day 04" begin
        include("test_day04.jl")
    end
    @testset "Day 05" begin
        include("test_day05.jl")
    end
    @testset "Day 06" begin
        include("test_day06.jl")
    end
end
