
class CashRegister

    attr_accessor :discount, :total, :items, :last_transaction_amount

    def initialize(discount=0)
        @total = 0
        @discount = discount
        @items =[]
    end

   def add_item(title, price, quantity=1)
    i = 0 
    @last_transaction_amount = @total
    while i < quantity
            @total += (price * quantity)
            @items.push(title)
            i+= 1
        end
        
   end

   def apply_discount
        self.total = @total -= (@total * discount / 100.to_f)
        if discount == 0
            "There is no discount to apply."
        elsif discount != 0
            "After the discount, the total comes to $#{self.total.to_i}."
        end

   end

   def void_last_transaction
    @total = @total - @last_transaction_amount
    end
end
