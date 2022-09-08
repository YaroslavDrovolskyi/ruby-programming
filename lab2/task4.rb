def convert_dec_to_bin(number)
    if (number.is_a?(Integer) == false) then return end
    if (number < 0) then return end

    result = ""
    while number > 0 do
        result = result + (number % 2).to_s
        number /= 2
    end

    return result.reverse
end


def main
    puts convert_dec_to_bin(123)
end

main