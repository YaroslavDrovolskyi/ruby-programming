require './task1.rb'
require 'minitest/autorun'

class TestTask1 < Minitest::Unit::TestCase

    def test_subtask_1
        assert_equal([false, false, false, false, false, true, false], subtask_1(true, false, true, 2, 10, -50))
        assert_equal([false, true, true, false, true, true, true], subtask_1(false, true, true, 10, 10, 10))
        assert_equal([false, false, false, false, false, false, false], subtask_1(true, false, true, -10, -10, -10))
        assert_equal([false, false, true, false, false, true, false], subtask_1(true, false, true, 15, 21, 73))
        assert_equal([false, false, true, false, false, true, false], subtask_1(true, false, true, 20, 25, 30))
    end


    def test_subtask_2
        assert_equal(false, subtask_2(2.5, true))
        assert_equal(true, subtask_2(2.5, false))
        assert_equal(false, subtask_2(1, false))
        assert_equal(false, subtask_2(1, true))
        assert_equal(true, subtask_2(1.1, false))
    end

end