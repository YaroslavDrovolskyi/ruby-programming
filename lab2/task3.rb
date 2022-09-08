def convert_bin_to_dec(number_str)
    
    if (number[0] < == '-') then return end

    result = 0
    n = number_str.length
    for i in 0..n - 1
        digit = number_str[i].to_i
        result += digit * (2 ** (n - 1 - i))
    end 
    
    return result
end


def main
    puts convert_bin_to_dec("1000010001")
end


main