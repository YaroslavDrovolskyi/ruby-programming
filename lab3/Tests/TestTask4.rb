require './task4.rb'
require 'minitest/autorun'


class TestTask4 < Minitest::Unit::TestCase

    def test_factorial
        # test with incorrect arguments
        assert_raises(RuntimeError, "n can't be < 0"){factorial(-1)}

        # test with correct arguments
        assert_equal(1, factorial(0))
        assert_equal(1, factorial(1))
        assert_equal(2, factorial(2))
        assert_equal(120, factorial(5))
        assert_equal(3628800, factorial(10))
    end


    def test_subtask_1
        expected = 0.0000214335
        assert_in_delta(expected, subtask_1(1e-3), 1e-3)
        assert_in_delta(expected, subtask_1(1e-5), 1e-5)
        assert_in_delta(expected, subtask_1(1e-6), 1e-6)
        assert_in_delta(expected, subtask_1(1e-7), 1e-7)
        assert_in_delta(expected, subtask_1(1e-10), 1e-10)
    end


    def test_subtask_2
        assert_equal(Math.log(1), subtask_2(1, 1e-1))
        assert_in_delta(Math.log(2), subtask_2(2, 1e-5), 1e-5)
        assert_in_delta(Math.log(3), subtask_2(3, 1e-5), 1e-5)
        assert_in_delta(Math.log(4), subtask_2(4, 1e-5), 1e-5)
        assert_in_delta(Math.log(5), subtask_2(5, 1e-9), 1e-9)
    end


    def test_subtask_3
        expected = 0.03345657988534157586489798
        assert_in_delta(expected, subtask_3(1e-3), 1e-3)
        assert_in_delta(expected, subtask_3(1e-5), 1e-5)
        assert_in_delta(expected, subtask_3(1e-6), 1e-5)
        assert_in_delta(expected, subtask_3(1e-7), 1e-7)
        assert_in_delta(expected, subtask_3(1e-10), 1e-10)
    end



end