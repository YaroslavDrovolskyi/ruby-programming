class Point
    attr_accessor :x, :y

    def initialize(x, y)
        @x = x
        @y = y
    end

    def to_s
        return '(' + @x.to_s + '; ' + @y.to_s + ') '
    end


    def ==(other)
        return !other.nil? && other.instance_of?(Point) &&
                @x == other.x && 
                @y == other.y

    end 
end

$f = ->(x, a, b, c){
    x = x.to_f
    result = 0
    if (x < 0) && (b != 0)
        result = a * x**2 + b
    elsif (x > 0) && (b == 0)
        result = (x - a).to_f/(x - c)
    else 
        result = x.to_f / c
    end


    if ((((a.truncate | b.truncate) & (a.truncate | c.truncate)) == 0) && !result.nan? && result.finite?) 
        return result.to_i
    else
        return result
    end
}

def tabulate_function(f, a, b, c, x_start, x_end, dx)
    result = []
    (x_start..x_end).step(dx){ |x|
        result.append(Point.new(x, f.(x, a, b, c)))
    }
    return result
end

=begin
a = 10
b = 0
c = 10
x_start = -1.5
x_end = 2
dx = 0.5
puts "condition = #{(a.truncate | b.truncate) & (a.truncate | c.truncate)}"
puts tabulate_function($f, a, b, c, x_start, x_end, dx)

puts $f.(1,1,1,1)
puts 2
=end