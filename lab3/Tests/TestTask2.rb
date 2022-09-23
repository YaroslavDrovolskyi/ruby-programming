require './task2.rb'
require 'minitest/autorun'

class TestTask1 < Minitest::Unit::TestCase

    def test_y_if
        # test interval [-4; 0)
        expected = 0.83221772589 + 0.40077493411i
        actual = y_if(-4)
        assert_in_delta(expected.abs, actual.abs, 1e-6)
        assert_in_delta(expected.imaginary, actual.imaginary, 1e-6)

        #test interval [0; 12]
        expected = 0.4328373086 - 0.5427608176i
        actual = y_if(5)
        assert_in_delta(expected.abs, actual.abs, 1e-6)
        assert_in_delta(expected.imaginary, actual.imaginary, 1e-6)

        #test interval [0; 12]
        expected = 0
        actual = y_if(0)
        assert_in_delta(expected.abs, actual.abs, 1e-6)
        assert_in_delta(expected.imaginary, actual.imaginary, 1e-6)

        #test other intervals
        expected = 0.114391
        actual = y_if(15)
        assert_in_delta(expected.abs, actual.abs, 1e-6)
        assert_in_delta(expected.imaginary, actual.imaginary, 1e-6)


        expected = -0.818182
        actual = y_if(-5)
        assert_in_delta(expected.abs, actual.abs, 1e-6)
        assert_in_delta(expected.imaginary, actual.imaginary, 1e-6)
    end


    def test_y_switch
        # test interval [-4; 0)
        expected = 0.83221772589 + 0.40077493411i
        actual = y_switch(-4)
        assert_in_delta(expected.abs, actual.abs, 1e-6)
        assert_in_delta(expected.imaginary, actual.imaginary, 1e-6)

        #test interval [0; 12]
        expected = 0.4328373086 - 0.5427608176i
        actual = y_switch(5)
        assert_in_delta(expected.abs, actual.abs, 1e-6)
        assert_in_delta(expected.imaginary, actual.imaginary, 1e-6)

        #test interval [0; 12]
        expected = 0
        actual = y_switch(0)
        assert_in_delta(expected.abs, actual.abs, 1e-6)
        assert_in_delta(expected.imaginary, actual.imaginary, 1e-6)

        #test other intervals
        expected = 0.114391
        actual = y_switch(15)
        assert_in_delta(expected.abs, actual.abs, 1e-6)
        assert_in_delta(expected.imaginary, actual.imaginary, 1e-6)


        expected = -0.818182
        actual = y_switch(-5)
        assert_in_delta(expected.abs, actual.abs, 1e-6)
        assert_in_delta(expected.imaginary, actual.imaginary, 1e-6)
    end

end