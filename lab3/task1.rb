def subtask_1(a, b, c, x, y, z)
    result = []
    
    result.append(!(a || b) && (a && !b))
    result.append((z != y) && (6 >= y) && a || b && c && (x>=1.5)) # corrected typo in task
    result.append((8 - x * 2 <= z) && (x**2 <= y**2) || (z >= 15))
    result.append((x > 0) && (y < 0) || (z >= (x*y - y/x + (-z))))
    result.append(!(a || b && !(c || (!a || b))))
    result.append((x**2 + y**2 >= 1) && (x >= 0) && (y >= 0))
    result.append((a && ((c && b) != (b || a)) || c) && b)
 
    return result
end


def subtask_2(a, p)
    return ((Math.log(a) > a) || !p) && (Math.sqrt(a) < a**4)
end


def main
    a, b, c = true, false, true
    x, y, z = 2, 10, -50
    result_1 = subtask_1(true, false, true, 2, 10, -50)

    puts "\n1."
    print "A = #{a}, B = #{b}, C = #{c}\n"
    print "X = #{x}, Y = #{y}, Z = #{z}\n\n"
    for i in 0...result_1.length
        print i+1, ') ', result_1[i], "\n"
    end

    print "\n"

    result_2 = subtask_2(2.5, true)
    puts "2. ", result_2
end


main
