# Day 15: Chiton
load(::Day{15}, path) = permutedims(parse.(Int, hcat(split.(readlines(path), "")...)))

# Part 1 – Dynamic programming
function solve1(::Day{15}, risk)
    # Dynamic programming iteration:
    h, w = size(risk)
    totalrisk = fill(typemax(Int), h, w)

    # We start from the exit and walk left, summing up the risk.
    totalrisk[h, w] = risk[h, w]
    for col in (w - 1):-1:1
        totalrisk[h, col] = risk[h, col] + totalrisk[h, col + 1]
    end

    function updatetotalrisk!(r, row, col)
        r < totalrisk[row, col] && (totalrisk[row, col] = r)
        return nothing
    end

    # For every value in a row, we walk up, then all the way left and right,
    # accumumulating the risk. Only minimal risk is saved.
    for row in (h - 1):-1:1
        for col_bottom in 1:w
            # Update cell above previous row
            candidate = totalrisk[row + 1, col_bottom] + risk[row, col_bottom]
            updatetotalrisk!(candidate, row, col_bottom)
            # Walk left
            if col_bottom > 1
                candidate = totalrisk[row, col_bottom]
                for col_top in (col_bottom - 1):-1:1
                    candidate += risk[row, col_top]
                    updatetotalrisk!(candidate, row, col_top)
                end
            end
            # Walk right
            if col_bottom < w
                candidate = totalrisk[row, col_bottom]
                for col_top in (col_bottom + 1):w
                    candidate += risk[row, col_top]
                    updatetotalrisk!(candidate, row, col_top)
                end
            end
        end
    end
    println(totalrisk)

    # "The starting position is never entered, so its risk is not counted",
    # so we need to substract `risk[1, 1]`.
    return totalrisk[1, 1] - risk[1, 1]
end
# function solve2(::Day{15}, data)
# end

testresult1(::Day{15}) = 40
# testresult2(::Day{15}) =
