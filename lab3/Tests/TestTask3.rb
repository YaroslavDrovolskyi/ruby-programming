require './task3.rb'
require 'minitest/autorun'

class TestTask3 < Minitest::Unit::TestCase

    def test_subtask_1
        assert_equal(1, subtask_1(0))

        assert_in_delta(31967/27720.to_r, subtask_1(1), 1e-6)
        assert_in_delta(435208/693.to_r, subtask_1(2), 1e-6)
        assert_in_delta(41412589739/5544.to_r, subtask_1(5), 1e-6)
        assert_in_delta(5779262243648/693.to_f, subtask_1(10), 1e-6)

        assert_in_delta(260479/27720.to_f, subtask_1(-1), 1e-6)
        assert_in_delta(6433792/3465.to_f, subtask_1(-2), 1e-6)
        assert_in_delta(61900935499/5544.to_f, subtask_1(-5), 1e-6)
        assert_in_delta(7051702161688/693.to_f, subtask_1(-10), 1e-6)
       
       
    end


    def test_subtask_2
        # test with incorrect arguments
        assert_raises(RuntimeError, "n can't be < 1"){subtask_5(-1)}
        assert_raises(RuntimeError, "n can't be < 1"){subtask_5(0)}

        # test with correct arguments
        assert_equal(Math.sqrt(2), subtask_5(1))
        assert_equal(Math.sqrt(2 + Math.sqrt(2)), subtask_5(2))
        assert_equal(Math.sqrt(2 + Math.sqrt(2 + Math.sqrt(2))), subtask_5(3))
        assert_equal(Math.sqrt(2 + Math.sqrt(2 + Math.sqrt(2 + Math.sqrt(2)))), subtask_5(4))
        assert_equal(Math.sqrt(2 + Math.sqrt(2 + Math.sqrt(2 + Math.sqrt(2 + Math.sqrt(2))))), subtask_5(5))
        assert_equal(Math.sqrt(2 + Math.sqrt(2 + Math.sqrt(2 + Math.sqrt(2 + Math.sqrt(2 + Math.sqrt(2)))))), subtask_5(6))
        assert_equal(Math.sqrt(2 + Math.sqrt(2 + Math.sqrt(2 + Math.sqrt(2 + Math.sqrt(2 + Math.sqrt(2 + 
            Math.sqrt(2))))))), subtask_5(7))
        assert_equal(Math.sqrt(2 + Math.sqrt(2 + Math.sqrt(2 + Math.sqrt(2 + Math.sqrt(2 + Math.sqrt(2 + 
            Math.sqrt(2 + Math.sqrt(2)))))))), subtask_5(8))
        assert_equal(Math.sqrt(2 + Math.sqrt(2 + Math.sqrt(2 + Math.sqrt(2 + Math.sqrt(2 + Math.sqrt(2 + 
            Math.sqrt(2 + Math.sqrt(2 + Math.sqrt(2))))))))), subtask_5(9))
        assert_equal(Math.sqrt(2 + Math.sqrt(2 + Math.sqrt(2 + Math.sqrt(2 + Math.sqrt(2 + Math.sqrt(2 + 
            Math.sqrt(2 + Math.sqrt(2 + Math.sqrt(2 + Math.sqrt(2)))))))))), subtask_5(10))
    end

end