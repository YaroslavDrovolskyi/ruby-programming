require_relative 'LinearSystemSolver.rb'

def main
    print "n = "
    n = gets.to_i

    print "k = "
    k = gets.to_i 


    matrix = Matrix.generateMatrix(k,n)
    vector = Vector[*(1..n)]

    puts "\n\nA = "
    matrix.print
    puts "b = ", vector, "\n\n"

    print "Solution: ", LinearSystemSolver.solve(matrix, vector, n)
end


main