require_relative 'Luggage.rb'


def main

    luggages = [
        Luggage.new(5, 10.0),    # 2
        Luggage.new(1, 1.5),     # 1.5
        Luggage.new(4, 50.0),    # 12.5
        Luggage.new(2, 5.0),     # 2.5
        Luggage.new(3, 12.0),      # 4
        Luggage.new(4, 5.5),     # 1.375        
        Luggage.new(1, 0.7),     # 0.7
        Luggage.new(25, 52.1),   # 2.084
        Luggage.new(4, 6.7),     # 1.675
        Luggage.new(5, 8.8),     # 1.76
        Luggage.new(10, 100.0)   # 10

        # things number: 64
        # overall weight: 252.3
        # average weight of thing: 3.9421875
        # average number of things: 5.82
    ]

    puts "a)"
    task_a_result = task_a(luggages)
    if (!task_a_result)
        puts "Not found\n"
    else
        puts "#{task_a_result}", "\n"
    end

    puts "b)"
    task_b_result = task_b(luggages)
    puts "#{task_b_result[0]}, #{task_b_result[1]}", "\n"
    
    puts "c)"
    puts task_c(luggages), "\n"

    puts "d)"
    puts task_d(luggages), "\n"

    puts "e)"
    puts task_e(luggages), "\n"
end

main


