require 'pry'

class CashRegister
    attr_accessor :total, :discount, :items, :prices, :quantity
    
    def initialize(discount = 0)
        @total = 0
        @discount = discount
        @items  = []
        @prices = []
        @quantity = []
    end

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
        if self.discount > 0 
           self.total =  self.total * (100 - self.discount) / 100
            return "After the discount, the total comes to $#{self.total}."
        else
            return "There is no discount to apply."
        end
    end
    def void_last_transaction
        last_transaction_quantity = self.quantity.pop
        
        while last_transaction_quantity > 0
        self.total -= self.prices.pop
        last_transaction_quantity -= 1
        end
    end
end   
 
# binding.pry