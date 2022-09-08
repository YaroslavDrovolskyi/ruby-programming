def calculate_range(base, all_digits_count, int_digits_count)
    return (base ** int_digits_count) * (1 - base ** (1 - all_digits_count))
end


def main
    puts calculate_range(2, 17, 8)
end

main