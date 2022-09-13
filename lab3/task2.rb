def y_if(x)
    if ((-4...0) === x)
        return (((x-2).abs).to_f/(x**2 * Math.cos(x)))**(1.to_f/7)
    elsif ((0..12) === x)
        return 1.to_f / (((Math.tan(x + 1.to_f/Math.exp(x)))/(Math.sin(x)**2))**(7.to_f/2))
    else
        return 1/(1 + x/(1 + x/(1.to_f + x)))
    end
end


def y_switch(x)
    case x
    when -4...0
        return (((x-2).abs).to_f/(x**2 * Math.cos(x)))**(1.to_f/7)
    when 0..12
        return 1.to_f / (((Math.tan(x + 1.to_f/Math.exp(x)))/(Math.sin(x)**2))**(7.to_f/2))
    else
        return 1/(1 + x/(1 + x/(1.to_f + x)))
    end
end




def main
    x = 0
    puts "y = #{(y_if(x))}"
    puts "y = #{(y_switch(x))}"
end



main

