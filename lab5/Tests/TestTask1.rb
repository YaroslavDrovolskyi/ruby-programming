require './task1.rb'
require 'minitest/autorun'

class TestTask1 < Minitest::Unit::TestCase

    def test_f1
        eps = 1e-3
        n = 100000

        expected = 0.339202 
        assert_in_delta(expected, prm(0.3, 1, :f1, n), eps)
        assert_in_delta(expected, trp(0.3, 1, :f1, n), eps)

        expected = 0.58579 
        assert_in_delta(expected, prm(0, 1, :f1, n), eps)
        assert_in_delta(expected, trp(0, 1, :f1, n), eps)

        expected = 0.75328 
        assert_in_delta(expected, prm(5, 1000, :f1, n), eps)
        assert_in_delta(expected, trp(5, 1000, :f1, n), eps)


        expected = 0.018504 
        assert_in_delta(expected, prm(1000, 2000, :f1, n), eps)
        assert_in_delta(expected, trp(1000, 2000, :f1, n), eps)

        expected = 0.0472006 
        assert_in_delta(expected, prm(0.001, 0.05, :f1, n), eps)
        assert_in_delta(expected, trp(0.001, 0.05, :f1, n), eps)

        expected = 0.000997754
        assert_in_delta(expected, prm(0.001, 0.002, :f1, n), eps)
        assert_in_delta(expected, trp(0.001, 0.002, :f1, n), eps)

    end


    def test_f2
        eps = 1e-3
        n = 100000
        pi = Math::PI

        expected = 3.6
        assert_in_delta(expected, prm(0, pi/4, :f2, n), eps)
        assert_in_delta(expected, trp(0, pi/4, :f2, n), eps)


        expected = 0.75745549777185
        assert_in_delta(expected, prm(0, pi/8, :f2, n), eps)
        assert_in_delta(expected, trp(0, pi/8, :f2, n), eps)

        expected = 10.9180981527907
        assert_in_delta(expected, prm(0, pi/3, :f2, n), eps)
        assert_in_delta(expected, trp(0, pi/3, :f2, n), eps)

        expected = 7.3176182053441
        assert_in_delta(expected, prm(pi/4, pi/3, :f2, n), eps)
        assert_in_delta(expected, trp(pi/4, pi/3, :f2, n), eps)

        expected = 1.6348507842547
        assert_in_delta(expected, prm(pi/5, pi/4, :f2, n), eps)
        assert_in_delta(expected, trp(pi/5, pi/4, :f2, n), eps)

        expected = 1.9656291631920
        assert_in_delta(expected, prm(0, pi/5, :f2, n), eps)
        assert_in_delta(expected, trp(0, pi/5, :f2, n), eps)

    end
end