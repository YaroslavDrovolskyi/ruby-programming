def subtask_1(x)
    a = 2
    b = 3
    sum = 1
    for i in 1..10
        sum += (-1)**i * (a.to_f/b) * (x**i)
        a += 1
        b += 1
    end

    return sum
end

def subtask_5(n)
    if (n < 1) then raise 'n can\'t be < 1' end

    if (n == 1) then return Math.sqrt(2)
    else return Math.sqrt(2 + subtask_5(n - 1)) end
end

def main
    x = 2
    puts "1) #{subtask_1(x)}"
    puts "2) n=1:  #{subtask_5(1)}"
    puts "2) n=3:  #{subtask_5(3)}"
    puts "2) n=5:  #{subtask_5(5)}"
    puts "2) n=7:  #{subtask_5(7)}"
    puts "2) n=10: #{subtask_5(10)}"
end

main