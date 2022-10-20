# returns sum of negative items and sorts the array
def get_sum_of_negative(array)
    if array.empty? then raise "Array must be not empty" end
    
    array.sort!
    return array.select{|num| num < 0}.sum(0)
end

# returns product between min and max items and sorts the array
def get_product_between_min_max(array)
    if array.empty? then raise "Array must be not empty" end

    index_min = array.find_index(array.min)
    index_max = array.find_index(array.max)

    start_index = [index_min, index_max].min
    end_index = [index_min, index_max].max

    # max and min is same element or they are neighborhoods
    if (end_index - start_index <= 1)
        array.sort!
        return Float::NAN
    end


    result = array[(start_index + 1)..(end_index - 1)].inject(1){|product, x|
        product * x
    }

    array.sort!

    return result
end

=begin
array = [5, 8, 1, 90, 10]
puts get_product_between_min_max(array)
print array
=end
