#Could not have solved this problem without the helpful conversation on slack between others!
class CashRegister
    attr_accessor :total, :discount

    def initialize (discount=0)
        @total = 0
        @discount = discount
        @items = []
    end

    def add_item (title, price, quantity=1)
        @title = price * quantity
        @total += price * quantity
        if quantity == 1
            @items << title
        else
            while quantity >= 1
                @items << title
                quantity -= 1
            end
        end
    end

    def apply_discount 
        if @discount > 0
            @total *= ((100 - @discount.to_f)/100) #Jeff Adler on slack figured out this proper change between integers and floats
            "After the discount, the total comes to $#{@total.to_i}."
        else
            "There is no discount to apply."
        end
    end

    def items
        @items
    end

    def void_last_transaction #Daniel Hahm on slack came up with this clever code, I tweaked it a bit
        @items.pop()
        @total -= @title
    end

end
