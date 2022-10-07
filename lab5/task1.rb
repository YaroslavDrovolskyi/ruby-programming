# n is number of intevals - analogue of accuracy
# the bigger n is more accurate
# assuming f parameter is lambda
def prm(a, b, f, n)
    h = (b - a).to_f/n
    sum = 0
    1.upto(n){|i|
        x_i = a + i*h - h/2.0 
        sum += f.(x_i)
    }
    sum *= h

    return sum
end


def trp(a, b, f, n)
    h = (b - a).to_f/n
    sum = 0

    (a..b).step(h){|x|
        sum += f.(x)
    }
    sum -= f.(a).to_f/2
    sum -= f.(b).to_f/2
    sum *= h

    return sum
end

=begin
def f1(x)
    return 1.to_f / ((x + 1)**(1.5))
end

def f2(x)
    return (Math.tan(x.to_f/2 + Math::PI.to_f/4))**3
end
=end

# define lambdas as a global variables

$f1 = ->(x){
    return 1.to_f / ((x + 1)**(1.5))
}

$f2 = ->(x){
    return (Math.tan(x.to_f/2 + Math::PI.to_f/4))**3
}


def display(a1, b1, a2, b2, n)
    puts "\n\nIntegrate f1 from #{a1} to #{b1}, n = #{n}"
    print "Rectangle method: ", prm(a1, b1, $f1, n), "\n"
    print "  Trapeze method: ", trp(a1, b1, $f1, n), "\n\n"


    puts "Integrate f2 from #{a2} to #{b2}, n = #{n}"
    print "Rectangle method: ", prm(a2, b2, $f2, n), "\n"
    print "  Trapeze method: ", trp(a2, b2, $f2, n), "\n\n\n"
end

def main

    display(0.3, 1, 0.0, Math::PI/4, 1000)

end

main