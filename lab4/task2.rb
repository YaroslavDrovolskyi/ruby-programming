require 'matrix'

class  Matrix
    def []=(i, j, value)
        @rows[i][j] = value
    end

    def multiply(number)
        @rows.each_index{|i| 
            @rows[i].each_index{|j|
                @rows[i][j] *= number
            }
        }
    end

    def print()
        puts "\n", to_a().map(&:inspect), "\n"
    end

    def Matrix.randSquareMatrix(n)
        if (n <= 0) then raise "Size of matrix can't be <= 0" end
#        array = Array.new(n).map!{Array.new(n){rand(10)}}
        array = Array.new(n){Array.new(n){rand(10)}}
=begin
        for i in 0...n do
            for j in 0...n do
                array[i][j] = rand(10)
            end
        end
=end
        return Matrix[*array]
    end

end


def main
    matrix = Matrix.randSquareMatrix(8)
    number = 2
    print "A = "
    matrix.print

    print "#{number} * A = "
    matrix.multiply(number)
    matrix.print
end


main