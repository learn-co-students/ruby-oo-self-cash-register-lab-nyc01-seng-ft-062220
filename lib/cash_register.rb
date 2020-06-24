class CashRegister
    attr_accessor :total, :price, :discount, :quantity, :items

    def initialize(discount = 0)
        @total = 0
        @discount = discount
        @items = []
        @transactions = []
    end

    def add_item(title, price, quantity = 1)
        @total += price * quantity

        if quantity > 1
            @items.fill(title, 1..quantity)
            @transactions.push(price * quantity)
        else
            @items.push(title)
            @transactions.push(price)
        end
        p @transactions        
    end

    def apply_discount
        if @discount > 0
            #? how is #{total} valid on line 27
            @total -= ((total * discount) / 100.0).to_i
            "After the discount, the total comes to $#{self.total}."
        else
            "There is no discount to apply."
        end
    end

    def items
        @items
    end

    def void_last_transaction
        self.total = @total - @transactions.pop
    end
end