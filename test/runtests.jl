using AdventOfCode2021
using Printf
using Test

@testset "AdventOfCode2021" begin
    for day in 1:CURRENT_DAY
        testset_name = @sprintf("Day %02d", day)
        @testset "$testset_name" begin
            D = Day(day)
            @test test1(D) == testresult1(D)
            @printf("Solution of Day %2d – Part 1: %d\n", day, solve1(D))
            @test test2(D) == testresult2(D)
            @printf("Solution of Day %2d – Part 2: %d\n", day, solve2(D))
        end
    end
    # println("Solution of Day $(CURRENT_DAY) – Part 1: $(solve1(CURRENT_DAY))")
    # println("Solution of Day $(CURRENT_DAY) – Part 2: $(solve2(CURRENT_DAY))")
end
