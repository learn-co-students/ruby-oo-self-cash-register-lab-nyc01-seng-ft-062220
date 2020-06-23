require 'pry'

class CashRegister

    attr_accessor :total,:previous_total, :discount, :items

    def initialize(discount = 0)
        @total = 0
        @items = []
        @discount = discount
    end    

    def add_item(item,price,quantity = 1)
        
        quantity.times {self.items << item}

        self.previous_total = self.total
        self.total += (price * quantity)
    end

    def void_last_transaction
        self.total = self.previous_total
    end

    def apply_discount
        if self.discount != 0
            self.total -= (self.discount * (self.total * 0.01))
            return "After the discount, the total comes to $#{self.total.to_i}."
        else
            return "There is no discount to apply."
        end
    end

end
