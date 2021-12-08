module AdventOfCode2021
using Printf

const CURRENT_DAY = 6

include("dispatch.jl")
for day in 1:CURRENT_DAY
    include(@sprintf("day%02d.jl", day))
end

export Day, CURRENT_DAY
export data, testdata
export test1, test2, testresult1, testresult2
export solve1, solve2

end # module
