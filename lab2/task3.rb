def convert_bin_to_dec(number_str)
    
    if (number_str[0] == '-') 
        return (-1) * convert_bin_to_dec(number_str[1...number_str.length]) 
    end

    index_of_dot = number_str.index('.')
    exp = (index_of_dot == nil) ? (number_str.length - 1) : (index_of_dot - 1)
    result = 0
    for i in 0...number_str.length
        if number_str[i] == '.' then next end # skip dot
        digit = number_str[i].to_i
        result += digit * (2 ** exp)
        exp -= 1
    end 
    return result
end


def main
    result = convert_bin_to_dec("1000010001")
    if (result.is_a?(Integer) == false)
        result = result.to_f
    end

    puts result
end


main