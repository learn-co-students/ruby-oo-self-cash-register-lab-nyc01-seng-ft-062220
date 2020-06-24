

class CashRegister
    attr_accessor :discount, :total, :last_transaction
    
    def initialize(discount = 0)
        @total = 0
        @discount = discount
        @all_items = []
    end

    def add_item(title, price, quantity = 1)
        @total += (quantity * price)
        @last_transaction = price * quantity
        if quantity == 1
            @all_items.push(title)
        else
            while quantity >= 1
                @all_items.push(title)
                quantity -= 1
            end
        end
    end
    
    def apply_discount
        if @discount > 0
            @total *= ((100 - @discount.to_f)/100)
            p "After the discount, the total comes to $#{@total.to_i}."
        else
            p "There is no discount to apply."
        end
    end
    
    def items
       @all_items 
    end

    def void_last_transaction
        @total -= @last_transaction
    end

end

