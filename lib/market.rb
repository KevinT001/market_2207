class Market
  attr_reader :name,
              :vendors
  
  def initialize(name)
    @name = name
    @vendors = []
  end

  def add_vendor(vendor)
    @vendors << vendor
  end

  def vendor_names
    @vendors.map {|vendor| vendor.name}
  end

  def vendors_that_sell(item)
    @vendors.find_all {|vendor| vendor.inventory.include?(item)}
  end

  def total_inventory
    inventory_total = {}
    @vendors.find_all {|vendor| 
    vendor.inventory.each do |product, quantity| inventory_total[product]= quantity.sum.uniq
    } 
    inventory_total
  end

  def overstocked_items
    
  end

end
