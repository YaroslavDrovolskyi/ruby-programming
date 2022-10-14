require_relative 'Luggage.rb'
require 'minitest/autorun'

class TestLuggage < Minitest::Unit::TestCase


    def test_initialization
        luggage_1 = Luggage.new(1, 50.0)
        assert_equal(1, luggage_1.things_number)
        assert_equal(50.0, luggage_1.weight)

        luggage_2 = Luggage.new(50, 50.0)
        assert_equal(50, luggage_2.things_number)
        assert_equal(50.0, luggage_2.weight)

        assert_raises(RuntimeError, "Luggage.new(): Number of things must be > 0"){Luggage.new(-1, 50.0)}
        assert_raises(RuntimeError, "Luggage.new(): Weight must be > 0"){Luggage.new(5, -50.0)}
        assert_raises(RuntimeError, "Luggage.new(): Number of things must be > 0"){Luggage.new(0, -50.0)}
    end

    def test_average_weight
        assert_equal(50.0, Luggage.new(1, 50.0).average_weight_of_thing)
        assert_equal(1.0, Luggage.new(50, 50.0).average_weight_of_thing)
    end

    def test_equals
        assert_equal(true, Luggage.new(5, 5.0) == Luggage.new(5, 5.0))
        assert_equal(false, Luggage.new(5, 5.0) == Luggage.new(5, 6.0))
        assert_equal(false, Luggage.new(5, 5.0) == Luggage.new(6, 5.0))
        assert_equal(false, Luggage.new(5, 5.0) == Luggage.new(50, 50.0))
        assert_equal(false, Luggage.new(5, 5.0) == nil)
        assert_equal(false, Luggage.new(5, 5.0) == 5)
    end
    

    def test_task_a
        assert_raises(RuntimeError, "Array must be not empty"){task_a([])}

        luggages_1 = [
            Luggage.new(5, 10.0),    # 2
            Luggage.new(1, 1.5),     # 1.5
            Luggage.new(4, 50.0),    # 12.5
            Luggage.new(2, 5.0),     # 2.5
            Luggage.new(3, 12.0),      # 4
            Luggage.new(4, 5.5),     # 1.375        
            Luggage.new(1, 0.7),     # 0.7
            Luggage.new(25, 52.1),   # 2.084
            Luggage.new(4, 6.7),     # 1.675
            Luggage.new(5, 8.8),     # 1.76
            Luggage.new(10, 100.0)   # 10
        ]
        assert_equal(Luggage.new(3, 12.0), task_a(luggages_1))

        luggages_2 = [
            Luggage.new(1, 1.0),    # 2
            Luggage.new(1, 2.0),     # 1.5
        ]
        assert_nil(task_a(luggages_2))
    end

    def test_task_b
        assert_raises(RuntimeError, "Array must be not empty"){task_a([])}

        luggages_1 = [
            Luggage.new(5, 10.0),
            Luggage.new(1, 1.5),
            Luggage.new(4, 50.0),
            Luggage.new(2, 5.0),
            Luggage.new(3, 12.0),
            Luggage.new(4, 5.5),
            Luggage.new(1, 0.7),
            Luggage.new(25, 52.1),
            Luggage.new(4, 6.7),
            Luggage.new(5, 8.8),
            Luggage.new(10, 100.0)
        ]
        assert_equal([8, 2], task_b(luggages_1))


        luggages_2 = [
            Luggage.new(1, 10.0),
            Luggage.new(1, 1.5),
            Luggage.new(1, 50.0),
            Luggage.new(1, 5.0),
            Luggage.new(1, 12.0),
            Luggage.new(1, 5.5),    
            Luggage.new(1, 0.7),
            Luggage.new(1, 52.1),
            Luggage.new(1, 6.7),
            Luggage.new(1, 8.8),
            Luggage.new(1, 100.0)
        ]
        assert_equal([0, 0], task_b(luggages_2))


        luggages_3 = [
            Luggage.new(1, 10.0),
            Luggage.new(2, 1.5),
            Luggage.new(3, 50.0),
            Luggage.new(4, 5.0),
            Luggage.new(5, 12.0),
            Luggage.new(6, 5.5),    
            Luggage.new(7, 0.7),
            Luggage.new(8, 52.1),
        ]
        assert_equal([6, 4], task_b(luggages_3))

        luggages_4 = [  
            Luggage.new(7, 0.7),
            Luggage.new(8, 52.1),
        ]
        assert_equal([2, 1], task_b(luggages_4))
    end


    def test_rask_c
        assert_raises(RuntimeError, "Array must be not empty"){task_a([])}

        luggages_1 = [
            Luggage.new(5, 10.0),
            Luggage.new(1, 1.5),
            Luggage.new(4, 50.0),
            Luggage.new(2, 5.0),
            Luggage.new(3, 12.0),
            Luggage.new(4, 5.5),
            Luggage.new(1, 0.7),
            Luggage.new(25, 52.1),
            Luggage.new(4, 6.7),
            Luggage.new(5, 8.8),
            Luggage.new(10, 100.0)
        ]
        assert_equal(false, task_c(luggages_1))


        luggages_2 = [
            Luggage.new(5, 10.0),
            Luggage.new(5, 10.1),
            Luggage.new(10, 100.0)
        ]
        assert_equal(true, task_c(luggages_2))

        luggages_3 = [
            Luggage.new(5, 10.0),
            Luggage.new(5, 10.51),
            Luggage.new(10, 100.0)
        ]
        assert_equal(false, task_c(luggages_3))


        luggages_4 = [
            Luggage.new(5, 10.0),
            Luggage.new(15, 10.51),
            Luggage.new(10, 100.0)
        ]
        assert_equal(false, task_c(luggages_4))
        
    end

    def test_task_d
        assert_raises(RuntimeError, "Array must be not empty"){task_a([])}

        luggages_1 = [
            Luggage.new(5, 10.0),
            Luggage.new(1, 1.5),
            Luggage.new(4, 50.0),
            Luggage.new(2, 5.0),
            Luggage.new(3, 12.0),
            Luggage.new(4, 5.5),
            Luggage.new(1, 0.7),
            Luggage.new(25, 52.1),
            Luggage.new(4, 6.7),
            Luggage.new(5, 8.8),
            Luggage.new(10, 100.0)
        ]
        assert_equal(false, task_d(luggages_1))


        luggages_2 = [
            Luggage.new(5, 10.0),
            Luggage.new(1, 1.5),
            Luggage.new(4, 50.0),
            Luggage.new(2, 5.0),
            Luggage.new(3, 1000.0), # bigger only by weight
        ]
        assert_equal(false, task_d(luggages_2))


        luggages_3 = [
            Luggage.new(50, 101.0),
            Luggage.new(1, 1.5),
            Luggage.new(40000, 50.0), # bigger only by things number
            Luggage.new(201, 5.0),
            Luggage.new(33, 1000.0), # bigger only by weight
        ]
        assert_equal(false, task_d(luggages_3))

        luggages_4 = [
            Luggage.new(5, 10.0),
            Luggage.new(1, 1.5),
            Luggage.new(4, 50.0),
            Luggage.new(2, 5.0),
            Luggage.new(3000, 1000.0), # absolutely bigger
        ]
        assert_equal(true, task_d(luggages_4))

    end


    def test_task_e
        assert_raises(RuntimeError, "Array must be not empty"){task_a([])}

        luggages_1 = [
            Luggage.new(5, 10.0),
            Luggage.new(1, 1.5),
            Luggage.new(4, 50.0),
            Luggage.new(2, 5.0),
            Luggage.new(3, 12.0),
            Luggage.new(4, 5.5),
            Luggage.new(1, 0.7), # correct item
            Luggage.new(25, 52.1),
            Luggage.new(4, 6.7),
            Luggage.new(5, 8.8),
            Luggage.new(10, 100.0)
        ]
        assert_equal(true, task_e(luggages_1))

        # no such luggage
        luggages_2 = [
            Luggage.new(5, 10.0),
            Luggage.new(2, 1.5),
            Luggage.new(4, 50.0),
            Luggage.new(2, 5.0),
            Luggage.new(3, 12.0),
        ]
        assert_equal(false, task_e(luggages_2))
        

        luggages_3 = [
            Luggage.new(5, 10.0),
            Luggage.new(1, 300.0), # 1 thing, but > 30 kg
            Luggage.new(1, 30.0),  # 1 thing, but == 30 kg
            Luggage.new(2, 5.0),
            Luggage.new(3, 12.0),
        ]
        assert_equal(false, task_e(luggages_3))


        luggages_4 = [
            Luggage.new(5, 10.0),
            Luggage.new(1, 29.0), # correct item
            Luggage.new(4, 50.0),
            Luggage.new(2, 5.0),
            Luggage.new(3, 12.0),
        ]
        assert_equal(true, task_e(luggages_4))
    end

end