def factorial(n)
    n > 1 ? n * factorial(n - 1) : 1
end



def subtask_1(eps)
    sum = 0
    n = 2
    loop do
        addition = (factorial(n - 1).to_f/factorial(n + 1))**(n * (n + 1))
        if addition < eps
            return sum
        else
            sum += addition
            n += 1
        end
    end
end


def subtask_2(x, eps)
    sum = 0
    n = 0
    loop do
        addition = ((x-1)**(2*n + 1)).to_f/((2*n + 1)*(x+1)**(2*n + 1))
        if addition < eps
            return 2*sum
        else
            sum += addition
            n += 1
        end
    end
end


def subtask_3(eps)
    sum = 0
    n = 1
    loop do
        addition = (factorial(4*n - 1) * factorial(2*n - 1)).to_f/(factorial(4*n) * factorial(2*n) * 2**(2*n))
        if addition < eps
            return sum
        else
            sum += addition
            n += 1
        end
    end
end


def main
    x = 10
    eps = 0.00001
    puts "1) #{subtask_1(eps)}"
    
    # 2nd subtask
    ln = Math.log(x)
    sum = subtask_2(x, eps)
    delta = (ln - sum).abs
    puts "\n2)"
    puts "ln(#{x}) = #{ln}"
    puts "   sum = #{sum}"
    puts "ln - sum = #{ln - sum}"

    puts "3) #{subtask_3(eps)}"
end


main