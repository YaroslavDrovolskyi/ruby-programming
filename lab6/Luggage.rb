class Luggage
    attr_reader :things_number, :weight

    def initialize(things_number, weight)
        if (things_number <= 0)
            raise "Luggage.new(): Number of things must be > 0"
        end

        if (weight <= 0)
            raise "Luggage.new(): Weight must be > 0"
        end

        @things_number = things_number
        @weight = weight 
    end

    def average_weight_of_thing
        return weight.to_f / things_number
    end

    def to_s
        return "{#{@things_number} things, #{@weight} kg}"
    end

    def ==(other)
        return !other.nil? && other.instance_of?(Luggage) &&  
                self.things_number == other.things_number &&
                self.weight == other.weight
    end
end


# returns appropriate luggage 
def task_a(luggages)
    if (luggages.length == 0) 
        raise "Array must be not empty" 
    end

    overall_weight = luggages.inject(0){|sum, x| sum + x.weight}
    overall_things_number = luggages.inject(0){|sum, x| sum + x.things_number}
    overall_average_weight_of_thing = overall_weight.to_f / overall_things_number

    return luggages.find{|x|
        (x.average_weight_of_thing - overall_average_weight_of_thing).abs <= 0.3
    } 
end

def task_b(luggages)
    if (luggages.length == 0) 
        raise "Array must be not empty" 
    end
    
    things_number = luggages.inject(0){|sum, x| sum + x.things_number}
    average_things_number = things_number.to_f / luggages.length

    count_1 = 0
    count_2 = 0

    luggages.each do |x|
        if x.things_number > 2 then count_1 += 1  end
        if x.things_number > average_things_number then count_2 += 1 end
    end

    return[count_1, count_2]
end


def task_c(luggages)
    if (luggages.length == 0) 
        raise "Array must be not empty" 
    end
    
    for i in 0...luggages.length
        for j in (i+1)...luggages.length 
            if(luggages[i].things_number == luggages[j].things_number)
                if ((luggages[i].weight - luggages[j].weight).abs <= 0.5)
                    return true
                end
            end
        end
    end
    return false
end


def task_d(luggages)
    if (luggages.length == 0) 
        raise "Array must be not empty" 
    end
    
    for i in 0...luggages.length
        flag = true
        for j in 0...luggages.length 
            if i == j 
                next
            end

            if(luggages[i].things_number <= luggages[j].things_number || 
                    luggages[i].weight <= luggages[j].weight)
                flag = false
                break
            end
        end

        if flag 
            return flag 
        end
    end
    return false
end

def task_e(luggages)
    if (luggages.length == 0) 
        raise "Array must be not empty" 
    end
    
    luggage = luggages.find do |x|
        x.things_number == 1 && x.weight < 30
    end

    return !(luggage.nil?)
end