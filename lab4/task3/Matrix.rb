require 'matrix'

class  Matrix
    def []=(i, j, value)
        @rows[i][j] = value
    end

    def print()
        puts "\n", to_a().map(&:inspect), "\n"
    end

    def Matrix.generateMatrix(k, n)
        if (n < 3 || n > 9) then raise "Size of matrix must be in interval [3;9]" end
        if (k <= 0) then raise "k can't be <= 0" end

        # generate two-dimensional array
        array = Array.new(n){Array.new(n)}

        # fill this two-dimensional array
        for i in 0...n 
            for j in 0...n
                if i == j 
                    array[i][j] = 2.to_r
                else 
                    array[i][j] = (k + 2).to_r
                end
            end
        end

        return Matrix[*array]
    end

    def appendColumn(vector)
        if (self.row_count != vector.size) then
            raise "Row count of matrix must be equal to the size of vector" 
        end

        @rows.each_index{|i|
            @rows[i] << vector[i].to_r
        }

    end

    def divideRowBy(i, number)
        for j in 0...self.column_count
            self[i,j] = self[i,j] / number
        end
    end

    def trasformToUpperTriangle!
        n = self.row_count
        for i in 0...(self.row_count)
            if self[i,i] == 0
               raise "Can't perform transforming beacausse 0 is leading element" 
            end

            self.divideRowBy(i, self[i,i]) # make leading element = 1 

            if i != (n - 1) # if it is not last row
                # subtract coef * (leading row) from lower rows
                for k in (i+1)...(self.row_count)
                    coef = self[k, i]
                    for p in 0...(self.column_count)
                        self[k, p] -= coef * self[i,p]
                    end
                end
            end
        end
    end
end