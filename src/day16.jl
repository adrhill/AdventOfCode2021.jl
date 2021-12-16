# Day 16: Packet Decoder

# Parse as Int8 as there is not Int4 datatype, but only keep last 4 digits.
# This returns the "BITS" representation of our data:
function hex2bits(hex)
    return Vector{Char}(
        join(bitstring(i)[5:8] for i in parse.(Int8, split(hex, ""), base=16))
    )
end
load(::Day{16}, path) = hex2bits(readline(path))

function bin2num(binary_string) # independent of string length
    return sum(c == '1' ? 2^(i - 1) : 0 for (i, c) in enumerate(reverse(binary_string)))
end

# Part 1 & 2 use the same parser
function parse_transmission!(bitstream)
    version_sum = 0

    function parse_packet!(bitstream)
        bits = splice!(bitstream, 1:6)
        version = bin2num(bits[1:3])
        type_id = bin2num(bits[4:6])
        version_sum += version

        # Every parsed packet returns its value and length
        if type_id == 4 # packet is a literal value
            # Iterate over value sub-packets
            is_last_group = false
            val_bits = Vector{Char}()
            subpacket_count = 0

            while !is_last_group
                is_last_group = (popfirst!(bitstream) == '0')
                append!(val_bits, splice!(bitstream, 1:4))
                subpacket_count += 1
            end

            packet_length = 6 + subpacket_count * 5
            value = bin2num(val_bits)
        else
            # Packet is an operator acting on subpackets
            length_type_id = popfirst!(bitstream)
            subpackets = Vector{Tuple{Int, Int}}()
            if length_type_id == '0'
                # Parse subpacket by length of bits
                subpacket_length = bin2num(splice!(bitstream, 1:15))
                subpacket_bits = splice!(bitstream, 1:subpacket_length)
                while !isempty(subpacket_bits)
                    push!(subpackets, parse_packet!(subpacket_bits))
                end
                packet_length = 6 + subpacket_length
            else
                # Parse subpackets by number
                subpacket_number = bin2num(splice!(bitstream, 1:11))
                while length(subpackets) < subpacket_number
                    push!(subpackets, parse_packet!(bitstream))
                end
                packet_length = 6 + sum(last.(subpackets))
            end
            # Apply operators to subpackets
            if type_id == 0
                value = sum(first.(subpackets))
            elseif type_id == 1
                value = prod(first.(subpackets))
            elseif type_id == 2
                value = minimum(first.(subpackets))
            elseif type_id == 3
                value = maximum(first.(subpackets))
            elseif type_id == 5
                value = Int(first.(subpackets[1]) > first.(subpackets[2]))
            elseif type_id == 6
                value = Int(first.(subpackets[1]) < first.(subpackets[2]))
            elseif type_id == 7
                value = Int(first.(subpackets[1]) == first.(subpackets[2]))
            end
        end

        return value, packet_length
    end

    value, _ = parse_packet!(bitstream)
    return version_sum, value
end

# Part 1 – return sum of versions
solve1(::Day{16}, data) = first(parse_transmission!(deepcopy(data)))
# Part 2 – return value
solve2(::Day{16}, data) = last(parse_transmission!(deepcopy(data)))


# No test for for both parts, just pass:
testresult1(::Day{16}) = 0
test1(::Day{16}) = 0
testresult2(::Day{16}) = 0
test2(::Day{16}) = 0
