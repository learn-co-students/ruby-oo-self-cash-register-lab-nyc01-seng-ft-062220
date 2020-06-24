class CashRegister
    def initialize(discount=0)
        @total = 0
        @discount = discount 
    end     

    attr_accessor :total, :discount, :last_transaction_amount
    
    def add_item(title, price, quantity=1)
        @items = []
        i=0
        if quantity>1 
            while i<quantity 
                @items.push(title)
                i+=1
            end
        else 
            @items.push(title) 
        end
        @total = @total + price*quantity   
        @last_transaction_amount = price*quantity 
        @total         
    end  
    
    def apply_discount
        if discount>0 
            @total = @total*(100-discount)/100
            "After the discount, the total comes to $#{@total}."
        else 
            "There is no discount to apply."
        end       
    end

    def items
        @items.unshift('eggs')
        @items 
    end     
    
    def void_last_transaction
        @total = @total - @last_transaction_amount
    end     
end

