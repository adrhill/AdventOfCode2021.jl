# Day 19: Beacon Scanner
# Not super proud of this one, but it gets the job done...
const BeaconOffset = Tuple{Int,Int,Int}
const ScannerReading = Vector{BeaconOffset}

function load(::Day{19}, path)
    scanner_readings = Vector{ScannerReading}()
    for line in readlines(path)
        if isempty(line) && continue
        elseif line[2] == '-'
            push!(scanner_readings, ScannerReading()) # add scanner
        else
            push!(last(scanner_readings), Tuple(parse.(Int, split(line, ","))))
        end
    end
    return scanner_readings
end

# Part 1 – count number of unique beacons
function distances!(r::ScannerReading)
    n = length(r)
    sort!(r) # tuples get sorted in lexicographic order
    return [r[j] .- r[i] for i in 1:(n - 1) for j in (i + 1):n]
end

# This brilliant idea was shamelessly stolen from Gunnar Farnebäck in the Julia Zulip:
# We use an second distance-metric that is invariant w.r.t. rotation and sign changes.
function invariant_distances!(r::ScannerReading)
    n = length(r)
    sort!(r)
    return [sum(abs.(r[j] .- r[i])) for i in 1:n for j in (i + 1):n]
end

function rotate_scan!(new_reading::ScannerReading, old_reading::ScannerReading)
    old_dist = distances!(old_reading)
    for fwdir in [1, 2, 3]
        for fwsign in [1, -1]
            for updir in setdiff([1, 2, 3], fwdir)
                for upsign in [1, -1]
                    # The last direction is now fully determined:
                    rightdir = first(setdiff([1, 2, 3], [fwdir, updir]))
                    if [fwdir, updir] in [[1, 2], [2, 3], [3, 1]] # even permutation
                        rightsign = fwsign * upsign
                    else
                        rightsign = -fwsign * upsign
                    end

                    # Apply the rotation
                    directions = [fwdir, updir, rightdir]
                    signs = [fwsign, upsign, rightsign]
                    rotated = [Tuple(beacon[directions] .* signs) for beacon in new_reading]

                    # and stop the routine when a match is found
                    matches = length(intersect(old_dist, distances!(rotated)))
                    if matches >= 12
                        new_reading .= rotated
                        return nothing
                    end
                end
            end
        end
    end
    return nothing
end

function align_scan!(new_reading::ScannerReading, old_reading::ScannerReading)
    diffs = [a .- b for a in old_reading for b in new_reading]
    for d in diffs
        if count(==(d), diffs) >= 12
            map!(r -> r .+ d, new_reading, new_reading)
            return d
        end
    end
    return (0, 0, 0)
end

function solve1(::Day{19}, data)
    # precompute invariant distances for each scanner:
    n = length(data)
    dists = invariant_distances!.(data)
    checked = zeros(Bool, n)

    # Use positions of beacon 1 as reference
    beacon_positions = Set(data[1])
    checked[1] = true

    while !all(checked)
        # Select scanners to match
        matches = Dict{Tuple{Int,Int},Int}()
        for candidate in findall((!).(checked))
            for c in findall(checked)
                matches[(candidate, c)] = length(intersect(dists[candidate], dists[c]))
            end
        end
        new_scanner, old_scanner = argmax(matches)

        # Shift reading in place
        rotate_scan!(data[new_scanner], data[old_scanner])
        align_scan!(data[new_scanner], data[old_scanner])

        # Add beacon positions
        union!(beacon_positions, data[new_scanner])
        checked[new_scanner] = true
    end
    return length(beacon_positions)
end

# Part 2 – largest Manhattan distance between any two scanners
function solve2(::Day{19}, data)
    # precompute invariant distances for each scanner:
    n = length(data)
    dists = invariant_distances!.(data)
    checked = zeros(Bool, n)

    # Use positions of beacon 1 as reference
    checked[1] = true
    positions = [(0, 0, 0)]

    while !all(checked)
        # Select scanners to match
        matches = Dict{Tuple{Int,Int},Int}()
        for candidate in findall((!).(checked))
            for c in findall(checked)
                matches[(candidate, c)] = length(intersect(dists[candidate], dists[c]))
            end
        end
        new_scanner, old_scanner = argmax(matches)

        # Shift reading in place
        rotate_scan!(data[new_scanner], data[old_scanner])
        push!(positions, align_scan!(data[new_scanner], data[old_scanner]))
        checked[new_scanner] = true
    end
    return maximum(sum(abs, positions[i] .- positions[j]) for i in 1:n for j in (i + 1):n)
end

testresult1(::Day{19}) = 79
testresult2(::Day{19}) = 3621
