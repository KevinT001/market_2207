class Vendor
  attr_reader :name,
              :inventory
  def initialize(name)
    @name = name 
    @inventory = Hash.new(0)
  end

  def stock(item, amount)
    @inventory[item] += amount
  end

  def check_stock(items)
    @inventory[items]
  end

  #Last portion of iteration 2
  def potential_revenue
    total = 0 
    @inventory.each do |item, quantity|
      total += item.price * quantity
    end
    total
  end

end 




