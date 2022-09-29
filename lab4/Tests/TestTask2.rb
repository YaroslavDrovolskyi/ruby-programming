require './task2.rb'
require 'minitest/autorun'

class TestTask2 < Minitest::Unit::TestCase

    def test_matrix_multiply_by_a_number
        size = 8
        for i in -100..100
            assert(compare(Matrix.randSquareMatrix(size), i))
        end
    end


    def compare(matrix, number)
        init_matrix = matrix.clone()
        matrix.multiply(number)
        
        for i in 0...matrix.row_count
            for j in 0...matrix.column_count
                if ((matrix[i,j]) != (number * init_matrix[i,j]))
                    return false
                end
            end
        end

        return true
    end
end