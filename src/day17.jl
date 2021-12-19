# Day 17: Trick Shot
function load(::Day{17}, path)
    m = match(r"target area: x=(-?\d*)\.\.(-?\d*), y=(-?\d*)\.\.(-?\d*)", readline(path))
    return parse.(Int, m.captures)
end

# Part 1 – highest shot
# For this task, the trajectory in x doesn't matter as the probe will always fall
# vertically into the target area. We just brute-force compute all trajectories
# that end in the target area and return the highest point across all of these trajectories.
function solve1(::Day{17}, data; vmax=150)
    _, _, ymin, ymax = data

    ytrajectories = filter(
        trajectory -> in(last(trajectory), ymin:ymax),
        [cumsum(ẏ₀:-1:ymin) for ẏ₀ in 1:vmax],
    )
    return maximum(maximum.(ytrajectories))
end

# Part 2 – count all viable trajectories
function solve2(::Day{17}, data; vmax=150)
    xmin, xmax, ymin, ymax = data
    xrange = xmin:xmax
    yrange = ymin:ymax
    count = 0

    # List of viable trajectories in x
    xtrajectories = filter(
        trajectory -> any(in(xrange), trajectory), [cumsum(ẋ₀:-1:0) for ẋ₀ in 1:xmax]
    )

    for xtraj in xtrajectories
        # There are two types of xtrajectories:
        # a) those that have zero velocity in x when reaching the target
        # b) those that pass through the target

        steps_until_target = findall(in(xrange), xtraj)
        if length(xtraj) >= 2 && in(xtraj[end], xrange) && xtraj[end] == xtraj[end - 1] # case a
            ytrajectories = filter(
                trajectory -> any(in(yrange), trajectory[first(steps_until_target):end]),
                [cumsum(ẏ₀:-1:ymin) for ẏ₀ in ymin:vmax],
            )
            count += length(ytrajectories)
        else # case b
            vels = Vector{Int}()
            for step in steps_until_target
                ytrajectories = filter(
                    trajectory -> in(last(trajectory), yrange),
                    [cumsum(range(; start=ẏ₀, step=-1, length=step)) for ẏ₀ in ymin:vmax],
                )
                append!(vels, first.(ytrajectories))
            end
            count += length(unique!(vels))
        end
    end
    return count
end

testresult1(::Day{17}) = 45
testresult2(::Day{17}) = 112
