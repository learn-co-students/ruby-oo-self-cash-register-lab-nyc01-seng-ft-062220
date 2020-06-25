require 'pry'
class CashRegister 
    attr_reader :discount 
    attr_accessor :total, :last_transaction

    
    def initialize(discount=0)
        @discount=discount
        @total=0 
        @items=[]
       
    end

    def add_item(title, price, quantity=1)
        
        @total+=price*quantity
    
       quantity.times do
        @items << title 
       end
       self.last_transaction=price*quantity
       return @total
    end 

def apply_discount 
    if @discount==0
        return "There is no discount to apply."
    else 
         @total*=0.8
       return "After the discount, the total comes to $#{@total.to_i}." 
    end
end 

def items 
@items
end 

def void_last_transaction 
self.total -= self.last_transaction
end
end   

 