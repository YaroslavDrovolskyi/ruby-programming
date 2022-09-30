require_relative 'Matrix.rb'


class LinearSystemSolver
    def self.solve(matrix, free_vector, n)
        if (n < 3 || n > 9) then raise "n must be in interval [3;9]" end
        if (free_vector.size != matrix.column_count) then raise "vector and matrix must have same size" end
    
        # check if system has one solution
        expanded_matrix = Matrix[*matrix.clone.appendColumn(free_vector)]
        rank = matrix.rank
        if (rank == expanded_matrix.rank)
           if rank < n
                raise "Linear system is indefinite, and has an infinite number of solutions"
           end
        else
            raise "Linear system is incompatible and has no solutions"
        end
    
    
        # do straight way of Gauss algorithm
        expanded_matrix.trasformToUpperTriangle!
    
    
        # do reverse way of Gauss algorithm
        x = Array.new(n, 0)
    
        for i in (n-1).downto(0)
            sum = 0
            if (i != n-1)
                for j in i+1...n
                    sum += expanded_matrix[i, j] * x[j]
                end
            end
            x[i] = expanded_matrix[i, n] - sum
        end
    
        return Vector[*x]
    end


end
