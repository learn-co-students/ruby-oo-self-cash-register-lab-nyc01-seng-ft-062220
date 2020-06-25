require 'pry'

class CashRegister

    attr_accessor :total, :items, :discount, :prices
    attr_reader

    def initialize(discount = 0)
        @total = 0.to_f
        @items = []
        @discount = discount
        @prices = []
    end
    
    def add_item(title, price, quantity = 1)
        
        self.total += price * quantity

        @prices << price * quantity

        i = 0 
        while i < quantity do
            @items << title
            i += 1 
        end
    end

    def apply_discount

        if discount != 0
            off = @total -= (@total * discount / 100.to_f)
            return "After the discount, the total comes to $#{off.to_i}."
        else
            return "There is no discount to apply."
        end 
    end

    def items
        return @items
    end

    def void_last_transaction
        @total -= @prices.last
        return @total
    end

end