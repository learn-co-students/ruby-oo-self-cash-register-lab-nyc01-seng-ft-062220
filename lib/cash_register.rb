require 'pry'

class CashRegister
    attr_accessor :total, :discount, :items, :prices, :quantity

    
    def initialize(discount=0)
        @total = 0
        @discount = discount 
        @items = []
        @prices = []
        @quantity = []
    end
    # binding.pry
    
  
    def add_item(title, price, quantity=1)
        self.total += price * quantity
        i=0 
        self.quantity << quantity
        while i < quantity
            self.items << title
            self.prices << price
            i+=1
        end
    end

    def apply_discount
        if @discount > 0
            @total *= ((100 - discount.to_f)/100) 
             return "After the discount, the total comes to $#{@total.to_i}." 
        else
             return "There is no discount to apply."
        end
    end

    def items
        @items
    end

    def void_last_transaction
        void_last_quantity = self.quantity.pop
        while void_last_quantity > 0
        self.total -= self.prices.pop
            void_last_quantity -= 1
        end
    end

end
