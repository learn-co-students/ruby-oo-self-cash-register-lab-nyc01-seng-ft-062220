require "pry"
class CashRegister
    attr_accessor :discount, :total, :items
    def initialize(discount = nil)
        @total = 0.0
        @discount = discount
        @items = []
        @prices = {}
        @receipts = []
    end

    def add_item(title, price, quantity = 1)
        i = 0
        while i < quantity
            @items << title
            @prices[title] = price
            i += 1    
        end
        @receipts << {item: title, price: price, quantity: quantity}
        @total += price * quantity
    end

    def apply_discount
        if discount
            @total = @total * (1 - (@discount.to_f/100))
            return "After the discount, the total comes to $#{@total.to_i}."
        end
        "There is no discount to apply."
    end

    def void_last_transaction
        @receipts.pop[:quantity].times do
            last_item = @items.pop
            @total -= @prices[last_item]
        end
    end

end