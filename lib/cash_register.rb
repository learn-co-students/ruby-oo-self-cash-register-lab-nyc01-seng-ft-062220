class CashRegister
    @@items = []
    attr_accessor :total, :discount
    
    def initialize(discount=0)
        @total = 0
        @discount = discount 
    end

    
  
    def add_item(title, price, quantity=1)
        if  quantity == 1 
            @items << title
            @total += price
        else
            quantity.times {|i| @items << title }
            @total += price * quantity
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

    end

end