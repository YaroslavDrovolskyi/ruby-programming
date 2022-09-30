require_relative 'LinearSystemSolver.rb'
require 'minitest/autorun'

class TestTask3 < Minitest::Unit::TestCase

    def test_SolveSystem()
        for n in 3..9
            for k in 1..100
                matrix = Matrix.generateMatrix(k,n)
                vector = Vector[*(1..n)]
                assert_equal(getRightSolution(n,k), LinearSystemSolver.solve(matrix, vector, n))
            end
        end
    end


    # It will return correct vector-solution for n and k
    # correct solution is calculated based on common solution of system with parameter k
    def getRightSolution(n, k)
        case n
        when 3
            return calulate3(k)
        when 4
            return calulate4(k)
        when 5
            return calulate5(k)
        when 6
            return calulate6(k)
        when 7
            return calulate7(k)
        when 8
            return calulate8(k)
        when 9
            return calulate9(k)
        end
    end


    def calulate3(k)
        n = 3
        array = Array.new(n, 0)

        array[0] = (2*k + 3).to_r/(k**2 + 3*k)
        array[1] = 1.to_r/(k+3)
        array[2] = (-3).to_r/(k**2 + 3*k)

        return Vector[*array]
    end

    def calulate4(k)
        n = 4
        array = Array.new(n, 0)

        array[0] = (7*k + 12).to_r/(3*k**2 + 8*k)
        array[1] = (4*k + 4).to_r/(3*k**2 + 8*k)
        array[2] = (k - 4).to_r/(3*k**2 + 8*k)
        array[3] = (-2*k - 12).to_r/(3*k**2 + 8*k)

        return Vector[*array]
    end

    def calulate5(k)
        n = 5
        array = Array.new(n, 0)

        array[0] = (11*k + 20).to_r/(4*k**2 + 10*k)
        array[1] = (7*k + 10).to_r/(4*k**2 + 10*k)
        array[2] = (3).to_r/(4*k + 10)
        array[3] = ((-1)*k - 10).to_r/(4*k**2 + 10*k)
        array[4] = (-5*k - 20).to_r/(4*k**2 + 10*k)

        return Vector[*array]
    end

    def calulate6(k)
        n = 6
        array = Array.new(n, 0)

        array[0] = (16*k + 30).to_r / (5*k**2 + 12*k)
        array[1] = (11*k + 18).to_r / (5*k**2 + 12*k)
        array[2] = (6*k + 6).to_r / (5*k**2 + 12*k)
        array[3] = (k - 6).to_r / (5*k**2 + 12*k)
        array[4] = (-4*k - 18).to_r / (5*k**2 + 12*k)
        array[5] = (-9*k - 30).to_r / (5*k**2 + 12*k)

        return Vector[*array]
    end

    def calulate7(k)
        n = 7
        array = Array.new(n, 0)

        array[0] = (11*k + 21).to_r / (3*k**2 + 7*k)
        array[1] = (8*k + 14).to_r / (3*k**2 + 7*k)
        array[2] = (5*k + 7).to_r / (3*k**2 + 7*k)
        array[3] = 2.to_r / (3*k + 7)
        array[4] = ((-1)*k - 7).to_r / (3*k**2 + 7*k)
        array[5] = (-4*k - 14).to_r / (3*k**2 + 7*k)
        array[6] = (-7*k - 21).to_r / (3*k**2 + 7*k)

        return Vector[*array]
    end

    def calulate8(k)
        n = 8
        array = Array.new(n, 0)

        array[0] = (29*k + 56).to_r / (7*k**2 + 16*k)
        array[1] = (22*k + 40).to_r / (7*k**2 + 16*k)
        array[2] = (15*k + 24).to_r / (7*k**2 + 16*k)
        array[3] = (8*k + 8).to_r / (7*k**2 + 16*k)
        array[4] = (k - 8).to_r / (7*k**2 + 16*k)
        array[5] = (-6*k - 24).to_r / (7*k**2 + 16*k)
        array[6] = (-13*k - 40).to_r / (7*k**2 + 16*k)
        array[7] = (-20*k - 56).to_r / (7*k**2 + 16*k)

        return Vector[*array]
    end

    
    def calulate9(k)
        n = 9
        array = Array.new(n, 0)

        array[0] = (37*k+72).to_r / (8*k**2 + 18*k)
        array[1] = (29*k+54).to_r / (8*k**2 + 18*k)
        array[2] = (21*k+36).to_r / (8*k**2 + 18*k)
        array[3] = (13*k+18).to_r / (8*k**2 + 18*k)
        array[4] = (5).to_r / (8*k+18)
        array[5] = (-3*k-18).to_r / (8*k**2 + 18*k)
        array[6] = (-11*k-36).to_r / (8*k**2 + 18*k)
        array[7] = (-19*k-54).to_r / (8*k**2 + 18*k)
        array[8] = (-27*k-72).to_r / (8*k**2 + 18*k)

        return Vector[*array]
    end


    

end