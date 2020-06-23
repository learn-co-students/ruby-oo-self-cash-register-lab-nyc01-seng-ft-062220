require 'pry'

class CashRegister
    attr_accessor :total, :title, :previous_total, :discount, :item
    
    def initialize(discount = 0)
        @total = 0
        @discount = discount
        @item = []
    end

    def add_item(title, price, quantity = 1)

      quantity.times {self.item << title}

      self.previous_total = self.total
      self.total += price * quantity
        
    end

    def apply_discount

        if discount != 0
            self.total = total - total * discount / 100
            p "After the discount, the total comes to $#{self.total}."
        else
            p"There is no discount to apply."
        end
        
    end

    def items
        item
    end

    def void_last_transaction
        self.total = self.previous_total
    end
    
end
