class LuggagesController < ApplicationController
    def index
        @luggages = Luggage.all
    end

    # create operation
    def show
        @luggage = Luggage.find(params[:id])
    end

    def new
        @luggage = Luggage.new
    end
    
    def create
        @luggage = Luggage.new(luggage_params)
    
        if @luggage.save
          redirect_to @luggage
        else
          render :new, status: :unprocessable_entity
        end
    end

    # update operation
    def edit
        @luggage = Luggage.find(params[:id])
    end
    
    def update
        @luggage = Luggage.find(params[:id])

        if @luggage.update(luggage_params)
            redirect_to @luggage
        else
            render :edit, status: :unprocessable_entity
        end
    end

    def destroy
        @luggage = Luggage.find(params[:id])
        @luggage.destroy
    
        redirect_to root_path, status: :see_other
    end

    def task_a
        luggages = Luggage.all
        if (luggages.length == 0) 
            raise "Array must be not empty" 
        end
    
        overall_weight = luggages.inject(0){|sum, x| sum + x.weight}
        overall_things_number = luggages.inject(0){|sum, x| sum + x.things_number}
        overall_average_weight_of_thing = overall_weight.to_f / overall_things_number
    
        @luggage = luggages.find{|x|
            x_average_weight_of_thing = x.weight.to_f / x.things_number
            (x_average_weight_of_thing - overall_average_weight_of_thing).abs <= 0.3
        } 
        redirect_to @luggage
    end
    
    def task_b
        luggages = Luggage.all
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
    
        @result = [count_1, count_2]
    end
    
    
    def task_c
        luggages = Luggage.all
        if (luggages.length == 0) 
            raise "Array must be not empty" 
        end
        for i in 0...luggages.length
            for j in (i+1)...luggages.length 
                if(luggages[i].things_number == luggages[j].things_number)
                    if ((luggages[i].weight - luggages[j].weight).abs <= 0.5)
                        @result = true
                        return
                    end
                end
            end
        end
        @result = false
        
        
    end
    
    
    def task_d
        luggages = Luggage.all
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
                @result = flag 
                return
            end
        end
        
        @result = false
       
    end
    
    def task_e
        luggages = Luggage.all
        if (luggages.length == 0) 
            raise "Array must be not empty" 
        end
        
        luggage = luggages.find do |x|
            x.things_number == 1 && x.weight < 30
        end
    
        @result = !(luggage.nil?)
    end
    
    private
    # filter params, for not to allow user set private parameters
    def luggage_params
        params.require(:luggage).permit(:things_number, :weight)
    end
end
