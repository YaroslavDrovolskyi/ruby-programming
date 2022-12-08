class Luggage < ApplicationRecord
    validates :things_number, numericality: {allow_blank: false, only_integer: true, greater_than_or_equal_to: 1}
    validates :weight, numericality: {allow_blank: false, greater_than: 0}

    def ==(other)
        return !other.nil? && other.instance_of?(Luggage) &&  
                self.things_number == other.things_number &&
                self.weight == other.weight
    end
end
