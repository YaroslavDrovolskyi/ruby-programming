require './task2.rb'
require 'minitest/autorun'


class TestTask2 < Minitest::Unit::TestCase

    def test_sum_of_negative
        # empty array
        assert_raises(RuntimeError, "Array must be not empty"){get_sum_of_negative([])}

        # ordinary case
        array = [1, 5.5, -1001, 560, -23, -5, -2.3, 0] 
        result = get_sum_of_negative(array)
        assert_in_delta(-1031.3, result, 1e-6)
        assert_equal(array.sort, array)

        # no negative elements
        array = [1, 5.5, 1001, 560, 23, 5, 2.3, 0] 
        result = get_sum_of_negative(array)
        assert_in_delta(0, result, 1e-6)
        assert_equal(array.sort, array)
    end

    def test_product_between_min_max
        # empty array
        assert_raises(RuntimeError, "Array must be not empty"){get_product_between_min_max([])}

        # no items between min and max
        array = [1, 5.5, -1001, 560, -23, -5, 100, 0] 
        result = get_product_between_min_max(array)
        assert(result.nan?)
        assert_equal(array.sort, array)

        # 1 element (no items between min and max)
        array = [1] 
        result = get_product_between_min_max(array)
        assert(result.nan?)
        assert_equal(array.sort, array)

        # ordinary case (without 0)
        array = [1, 5.5, -1001, -23, -5, 560, 0] 
        result = get_product_between_min_max(array)
        assert_in_delta(115, result, 1e-6)
        assert_equal(array.sort, array)

        # ordinary case (with 0)
        array = [1, 5.5, -1001, -23, -5, 0, 560] 
        result = get_product_between_min_max(array)
        assert_in_delta(0, result, 1e-6)
        assert_equal(array.sort, array)
    end
end