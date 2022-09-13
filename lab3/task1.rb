def subtask_1(a, b, c, x, y, z)
    puts "\n1."
    print "A = #{a}, B = #{b}, C = #{c}\n"
    print "X = #{x}, Y = #{y}, Z = #{z}\n\n"
    print "a) ", !(a || b) && (a && !b), "\n"
    print "b) ", (z != y) && (6 >= y) && a || b && c && (x>=1.5), "\n" # corrected typo in task
    print "c) ", (8 - x * 2 <= z) && (x**2 <= y**2) || (z >= 15), "\n"
    print "d) ", (x > 0) && (y < 0) || (z >= (x*y - y/x + (-z))), "\n"
    print "e) ", !(a || b && !(c || (!a || b))), "\n"
    print "f) ", (x**2 + y**2 >= 1) && (x >= 0) && (y >= 0), "\n"
    print "g) ", (a && ((c && b) != (b || a)) || c) && b, "\n\n"
end


def subtask_2(a, p)
    puts "2.", ((Math.log(a) > a) || !p) && (Math.sqrt(a) < a**4)
end


def main
    subtask_1(true, false, true, 2, 10, -50)
    subtask_2(2.5, true)
end


main
