
class CashRegister
    attr_accessor :total, :discount, :items
   attr_reader :last_item
    def initialize (discount=0)
        @total = 0
        @discount = discount
        @items = []
        @last_item =[]
    end   


    def add_item (title,price,quantity=1)  
       @total += (price*quantity)
       quantity.times {@items << title}
        @last_item << {:item =>title, :price =>price, :quantity => quantity}
    end   

    def apply_discount
       
        if @discount == 0
         "There is no discount to apply."
        else
        @total *= ((100.0-@discount)/100)
        "After the discount, the total comes to $#{@total.to_i}."
        end
    end    

    def void_last_transaction
        if @last_item.empty?
            return 0.0
        else    
            @total -= @last_item[-1][:price]*@last_item[-1][:quantity]
            @last_item.delete_at(-1)
        end

    end   
end
