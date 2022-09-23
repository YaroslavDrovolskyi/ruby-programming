require './task5.rb'
require 'minitest/autorun'


class TestTask5 < Minitest::Unit::TestCase

    def test_func_y
        #x, n, c
        assert_in_delta(5.53325, func_y(5,5,5), 1e-5)
        assert_in_delta(7.70745, func_y(5,10,15), 1e-5)
        assert_in_delta(0.0666667, func_y(0,5,-5), 1e-5)
        assert_in_delta(2.2, func_y(5,0,1645), 1e-5)
        assert_in_delta(0.911111, func_y(-5,0,234), 1e-5)
    end

    def test_func_z
        assert_in_delta(1.01088998837018639, func_z(5,5,5), 1e-5)
        assert_in_delta(0.8453570112769601, func_z(-5,0,1), 1e-5)
        assert_in_delta(1.082654774634808, func_z(10,10,10), 1e-5)
        assert_in_delta(0.004387218569754761, func_z(100,-5,0), 1e-5)
        assert_in_delta(-0.3222709941548302, func_z(25,-10,5), 1e-5)
    end


    def test_func_f
        assert_in_delta(func_y(4,5,5), func_f(4,5,5), 1e-5)
        assert_in_delta(func_z(15,10,1), func_f(15,10,1), 1e-5)
        assert_in_delta(func_y(10,10,10) + func_z(10,10,10), func_f(10,10,10), 1e-5)
        assert_in_delta(func_y(100,-5,0) + func_z(100,-5,0), func_f(100,-5,0), 1e-5)
        assert_in_delta(func_y(25,-10,5) + func_z(25,-10,5), func_f(25,-10,5), 1e-5)
    end

    def test_tabulate_step
        expected = [Point.new(1,2), Point.new(2,4), Point.new(3,6), Point.new(4,8), Point.new(5,10)]
        assert(equal_arrays(expected, tabulate_step(:f_1, 1, 5, 4, 0, 0)))

        expected = [Point.new(1,-2), Point.new(2, -4), Point.new(3,-6), Point.new(4,-8), Point.new(5,-10)]
        assert(equal_arrays(expected, tabulate_step(:f_2, 1, 5, 4, 0, 0)))

        expected = [Point.new(1,1), Point.new(2,4), Point.new(3,9), Point.new(4,16), Point.new(5,25)]
        assert(equal_arrays(expected, tabulate_step(:f_3, 1, 5, 4, 0, 0)))
    end

    def test_tabulate_while
        expected = [Point.new(1.0,2.0), Point.new(2.0,4.0), Point.new(3.0,6.0), Point.new(4.0,8.0), Point.new(5.0,10.0)]
        assert(equal_arrays(expected, tabulate_while(:f_1, 1, 5, 4, 0, 0)))

        expected = [Point.new(1,-2), Point.new(2, -4), Point.new(3,-6), Point.new(4,-8), Point.new(5,-10)]
        assert(equal_arrays(expected, tabulate_while(:f_2, 1, 5, 4, 0, 0)))

        expected = [Point.new(1,1), Point.new(2,4), Point.new(3,9), Point.new(4,16), Point.new(5,25)]
        assert(equal_arrays(expected, tabulate_while(:f_3, 1, 5, 4, 0, 0)))
    end


    def f_1 (x, n, c)
        return 2*x    
    end

    def f_2 (x, n, c)
        return -2*x    
    end

    def f_3 (x, n, c)
        return x**2    
    end

    def equal_arrays(arr1, arr2)
        if (arr1.length != arr2.length) then return false end

        for i in 0...(arr1.length)
            if (arr1[i].x != arr2[i].x) then return false end
            if (arr1[i].y != arr2[i].y) then return false end    
        end

        return true
    end
   
end