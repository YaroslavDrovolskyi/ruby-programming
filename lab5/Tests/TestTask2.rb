require './task2.rb'
require 'minitest/autorun'

class TestTask2 < Minitest::Unit::TestCase


    def test_calculate_series_at_point
        eps = 1e-2

        #n = -1
        assert_in_delta(1.11612, calculate_series_at_point(0.1), eps)
        assert_in_delta(1.24573, calculate_series_at_point(0.2), eps)
        assert_in_delta(1.39039, calculate_series_at_point(0.3), eps)
        assert_in_delta(1.55185, calculate_series_at_point(0.4), eps)
        assert_in_delta(1.73205, calculate_series_at_point(0.5), eps)
        assert_in_delta(1.93318, calculate_series_at_point(0.6), eps)
        assert_in_delta(2.15767, calculate_series_at_point(0.7), eps)
        assert_in_delta(2.40822, calculate_series_at_point(0.8), eps)
        assert_in_delta(2.68788, calculate_series_at_point(0.9), eps)
        assert_in_delta(3, calculate_series_at_point(1), eps)
        assert_in_delta(5.19615, calculate_series_at_point(1.5), eps)
        assert_in_delta(243, calculate_series_at_point(5), eps)
        assert_in_delta(59049, calculate_series_at_point(10), eps)
#        assert_in_delta(717897987691852588770249, calculate_series_at_point(50), eps)

        # n = 10
        assert_in_delta(1.11612, calculate_series_at_point(0.1, 10), eps)
        assert_in_delta(1.24573, calculate_series_at_point(0.2, 10), eps)
        assert_in_delta(1.39039, calculate_series_at_point(0.3, 10), eps)
        assert_in_delta(1.55185, calculate_series_at_point(0.4, 10), eps)
        assert_in_delta(1.73205, calculate_series_at_point(0.5, 10), eps)
        assert_in_delta(1.93318, calculate_series_at_point(0.6, 10), eps)
        assert_in_delta(2.15767, calculate_series_at_point(0.7, 10), eps)
        assert_in_delta(2.40822, calculate_series_at_point(0.8, 10), eps)
        assert_in_delta(2.68788, calculate_series_at_point(0.9, 10), eps)
        assert_in_delta(2.9999999224640, calculate_series_at_point(1, 10), eps)
        assert_in_delta(5.19615, calculate_series_at_point(1.5, 10), eps)
        assert_in_delta(27253.85139916104649169976, calculate_series_at_point(10, 10), eps)

        # n = 20
        assert_in_delta(1.11612, calculate_series_at_point(0.1, 20), eps)
        assert_in_delta(1.24573, calculate_series_at_point(0.2, 20), eps)
        assert_in_delta(1.39039, calculate_series_at_point(0.3, 20), eps)
        assert_in_delta(1.55185, calculate_series_at_point(0.4, 20), eps)
        assert_in_delta(1.73205, calculate_series_at_point(0.5, 20), eps)
        assert_in_delta(1.93318, calculate_series_at_point(0.6, 20), eps)
        assert_in_delta(2.15767, calculate_series_at_point(0.7, 20), eps)
        assert_in_delta(2.40822, calculate_series_at_point(0.8, 20), eps)
        assert_in_delta(2.68788, calculate_series_at_point(0.9, 20), eps)
        assert_in_delta(5.19615, calculate_series_at_point(1.5, 10), eps)
    end

    def test_calculate_series_in_interval
        eps = 1e-2

        # n = -1
        expected = [1.11612, 1.24573, 1.39039, 1.55185, 1.73205, 1.93318, 2.15767,
            2.40822, 2.68788, 3]

        actual = calculate_series_in_interval()

        expected.each_index{|i|
            assert_in_delta(expected[i], actual[i], eps)
        }


        # n = 10
        expected = [1.11612, 1.24573, 1.39039, 1.55185, 1.73205, 1.93318, 2.15767,
            2.40822, 2.68788, 2.9999999224640104]

        actual = calculate_series_in_interval(10)

        expected.each_index{|i|
            assert_in_delta(expected[i], actual[i], eps)
        }


        # n = 20
        expected = [1.11612, 1.24573, 1.39039, 1.55185, 1.73205, 1.93318, 2.15767,
            2.40822, 2.68788, 3.0]

        actual = calculate_series_in_interval(20)

        expected.each_index{|i|
            assert_in_delta(expected[i], actual[i], eps)
        }
    end
end