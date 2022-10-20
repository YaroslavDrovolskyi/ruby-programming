require './task1.rb'
require 'minitest/autorun'


class TestTask1 < Minitest::Unit::TestCase

    def test_funcion_f
        assert_equal(1.0, $f.(1, 1, 1, 1))

        # result is integer
        assert_equal(10, $f.(-5, 0, 10, 0)) # x<0, b!=0
        assert_equal(-1, $f.(5, 0, 0, 10)) # x>0, b==0
        assert_equal(Float::INFINITY, $f.(1, 0, 10, 0)) # otherwise case

        # result is float
        assert_equal(27.0, $f.(-5, 1, 2, 5)) # x<0, b!=0
        assert_equal(-4.to_f/5, $f.(5, 1, 0, 10)) # x>0, b==0
        assert_equal(1.5, $f.(15, 1, 5, 10)) # otherwise case
    end


    def test_tabulating
        # result is integer
        expected = [Point.new(-1.0, 0), Point.new(-0.5, 0), Point.new(0.0, 0),
            Point.new(0.5, 0), Point.new(1.0, 0), Point.new(1.5, 0), Point.new(2.0, 0)]
        assert(compare_point_arrays_with_eps(expected, tabulate_function($f, 0, 0, 5, -1.0, 2, 0.5), 1e-6, 0))

        # result is integer
        expected = [Point.new(-1.6, 10), Point.new(-1.1, 10),
            Point.new(-0.6, 10), Point.new(-0.1, 10), 
            Point.new(0.4, Float::INFINITY), 
            Point.new(0.9, Float::INFINITY),
            Point.new(1.4, Float::INFINITY), Point.new(1.9, Float::INFINITY)]
        assert(compare_point_arrays_with_eps(expected, tabulate_function($f, 0, 10, 0, -1.6, 2, 0.5), 1e-6, 0))

        # result is integer, go through x=0
        expected = [Point.new(-1.5, 10), Point.new(-1.0, 10),
            Point.new(-0.5, 10), Point.new(0.0, Float::NAN), 
            Point.new(0.5, Float::INFINITY), 
            Point.new(1.0, Float::INFINITY),
            Point.new(1.5, Float::INFINITY), Point.new(2.0, Float::INFINITY)]
        assert(compare_point_arrays_with_eps(expected, tabulate_function($f, 0, 10, 0, -1.5, 2, 0.5), 1e-6, 0))

        # result is integer, go through x = 0
        expected = [Point.new(-1.5, 10), Point.new(-1.0, 10),
            Point.new(-0.5, 10), Point.new(0.0, Float::NAN), 
            Point.new(0.5, Float::INFINITY), 
            Point.new(1.0, Float::INFINITY),
            Point.new(1.5, Float::INFINITY), Point.new(2.0, Float::INFINITY)]
        assert(compare_point_arrays_with_eps(expected, tabulate_function($f, 0, 10, 0, -1.5, 2, 0.5), 1e-6, 0))


        # result is float, go through x = 0, b > 0
        expected = [Point.new(-1.5, 27.5), Point.new(-1.0, 15.0),
            Point.new(-0.5, 7.5), Point.new(0.0, 0.0), 
            Point.new(0.5, 0.05), Point.new(1.0, 0.1),
            Point.new(1.5, 0.15), Point.new(2.0, 0.2)]
        assert(compare_point_arrays_with_eps(expected, tabulate_function($f, 10, 5, 10, -1.5, 2, 0.5), 1e-6, 1e-6))

        # result is float, go through x = 0, b < 0
        expected = [Point.new(-1.5, 17.5), Point.new(-1.0, 5.0),
            Point.new(-0.5, -2.5), Point.new(0.0, 0.0), 
            Point.new(0.5, 0.05), Point.new(1.0, 0.1),
            Point.new(1.5, 0.15), Point.new(2.0, 0.2)]
        assert(compare_point_arrays_with_eps(expected, tabulate_function($f, 10, -5, 10, -1.5, 2, 0.5), 1e-6, 1e-6))

         # result is float, go through x = 0, b == 0
         expected = [Point.new(-1.5, -0.15), Point.new(-1.0, -0.1),
            Point.new(-0.5, -0.05), Point.new(0.0, 0.0), 
            Point.new(0.5, 1.0), Point.new(1.0, 1.0),
            Point.new(1.5, 1.0), Point.new(2.0, 1.0)]
        assert(compare_point_arrays_with_eps(expected, tabulate_function($f, 10, 0, 10, -1.5, 2, 0.5), 1e-6, 1e-6))
    end


    # allows INFINITY and NAN
    def compare_point_arrays_with_eps(arr1, arr2, eps_x, eps_y)
        if (arr1.length != arr2.length)
            return false
        end

        for i in (1...(arr1.length))
            if (arr1[i].x.to_f.nan? && arr2[i].x.to_f.nan?) ||
                (arr1[i].x.to_f.infinite? && arr2[i].x.to_f.infinite?)
                next
            end

            if (arr1[i].x - arr2[i].x).abs > eps_x
                return false
            end
        end

        for i in (1...(arr1.length))
            if (arr1[i].y.to_f.nan? && arr2[i].y.to_f.nan?) ||
                (arr1[i].y.to_f.infinite? && arr2[i].y.to_f.infinite?)
                next
            end

            if (arr1[i].y - arr2[i].y).abs > eps_y
                return false
            end
        end

        return true
    end
end