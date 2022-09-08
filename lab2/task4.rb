def convert_dec_to_bin(number, precision)
    if (number < 0)
        return '-' + convert_dec_to_bin((-1) * number, precision)
    end
    

    integer_part = number.truncate
    integer_part_str = ''
    while integer_part > 0 do
        integer_part_str = integer_part_str + (integer_part % 2).to_s
        integer_part /= 2
    end

    fraction_part_str = ''
    if (number.is_a?(Integer) == false)
        fraction_part = number % 1
        for i in 1..precision
            fraction_part *= 2
            fraction_part_str = fraction_part_str + fraction_part.truncate.to_s
            fraction_part %= 1
            if (fraction_part == 0) then break end
        end
    end

    if (integer_part_str.empty? == true)
        integer_part_str = '0'
    end

    if (fraction_part_str.empty? == false)
        fraction_part_str = '.' + fraction_part_str
    end

    return integer_part_str.reverse + fraction_part_str
end

# algorithm: https://www.log2base2.com/number-system/float-to-binary-conversion.html


def main
    puts convert_dec_to_bin(123, 5)
end

main