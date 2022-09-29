require './task1.rb'
require 'minitest/autorun'

class TestTask1 < Minitest::Unit::TestCase

    def test_repeated_entries_count
        #test with incorrect input
        assert_raises(RuntimeError, "Array must be not empty"){
            get_repeated_entries_count([])
        }

        # test with correct input (only >= 0 values)
        assert_equal(1, get_repeated_entries_count([1, 2, 2, 3]))
        assert_equal(0, get_repeated_entries_count([1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12]))
        assert_equal(4, get_repeated_entries_count([1, 2, 1, 2, 3, 4, 5, 1, 3, 6, 5, 8]))
        assert_equal(5, get_repeated_entries_count([1, 2, 3, 4, 5, 1, 2, 3, 4, 5, 0]))
        assert_equal(1, get_repeated_entries_count([5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5]))

        # test with values <0
        assert_equal(3, get_repeated_entries_count([1, 2, -1, 2, 3, -4, 5, 1, 3, 6, -5, 8]))
    end
end