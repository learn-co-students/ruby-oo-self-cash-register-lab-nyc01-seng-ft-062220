require 'pry'


class CashRegister

  attr_accessor :discount

  def initialize(discount=0)
    @total = 0
    @discount = discount
    @items = []
  end

  def discount
    @discount = 0
    @discount += 20
  end

  def add_item(item, price, quantity=1)
    index = 0
    while index < quantity
      self.items << item
      index += 1
    end

    total_price = price * quantity
    self.total += total_price
  end

  def apply_discount
    if @discount > 0
      @total *= ((100 - @discount.to_f)/100) #Thanks Matt Green for this line.
      return "After the discount, the total comes to $#{@total.to_i}."
    else
      return "There is no discount to apply."
    end
  end

  def void_last_transaction
    last_item = self.items[-1]

    binding.pry
  end

  def total=(total)
    @total = total
  end

  def total
    @total
  end

  def items
    @items
  end
end
