require './lib/item'
require './lib/vendor'
require './lib/market'

RSpec.describe Market do 
  before :each do 
    @market = Market.new("South Pearl Street Farmers Market")
    @item1 = Item.new({name: 'Peach', price: "$0.75"})
    @item2 = Item.new({name: 'Tomato', price: '$0.50'})
    @item3 = Item.new({name: "Peach-Raspberry Nice Cream", price: "$5.30"})
    @item4 = Item.new({name: "Banana Nice Cream", price: "$4.25"})
    @vendor1 = Vendor.new("Rocky Mountain Fresh")
    @vendor2 = Vendor.new("Ba-Nom-a-Nom")
    @vendor3 = Vendor.new("Palisade Peach Shack")
  end

  describe 'iteration 2' do 
    it 'exists' do 
      expect(@market).to be_a(Market)
    end

    it 'attributes' do 

      expect(@market.name).to eq("South Pearl Street Farmers Market")
    end

    it 'has vendors set to an empty array, if no vendors are added' do 
      expect(@market.vendors).to eq([])
    end

    it 'can stock vendors with items and add vendors to event vendors array' do 
      @vendor1.stock(@item1, 35)
      @vendor1.stock(@item2, 7)

      #stock items, then check inventory to make sure they are there, check item type count.
      expect(@vendor1.inventory).to eq({@item1 => 35, @item2 => 7})
      expect(@vendor1.inventory.size).to eq(2)

      @vendor2.stock(@item4, 50)
      @vendor2.stock(@item3, 25)

      expect(@vendor2.inventory).to eq({@item4 => 50, @item3 => 25})
      expect(@vendor2.inventory.size).to eq(2)

      @vendor3.stock(@item1, 65)
      expect(@vendor3.inventory).to eq({@item1 => 65})
      expect(@vendor3.inventory.size).to eq(1)

      @market.add_vendor(@vendor1)  #action to add vendor to array
      @market.add_vendor(@vendor2)
      @market.add_vendor(@vendor3)

      expect(@market.vendors).to eq([@vendor1, @vendor2, @vendor3])
      expect(@market.vendors.count).to eq(3)
    end

    it 'can return vendor names in array' do 
      @market.add_vendor(@vendor1)  
      @market.add_vendor(@vendor2)
      @market.add_vendor(@vendor3)

      expect(@market.vendor_names).to eq(["Rocky Mountain Fresh", "Ba-Nom-a-Nom", "Palisade Peach Shack"])
      expect(@market.vendor_names.count).to eq(3)
    end

    it 'can list vendors that sell a specific item' do 
      @vendor1.stock(@item1, 35)
      @vendor1.stock(@item2, 7)
      @vendor2.stock(@item4, 50)
      @vendor2.stock(@item3, 25)
      @vendor3.stock(@item1, 65)
      @market.add_vendor(@vendor1)  
      @market.add_vendor(@vendor2)
      @market.add_vendor(@vendor3)

      expect(@market.vendors_that_sell(@item1)).to eq([@vendor1, @vendor3])
      expect(@market.vendors_that_sell(@item1).count).to eq(2)
      expect(@market.vendors_that_sell(@item4)).to eq([@vendor2])
      expect(@market.vendors_that_sell(@item4).count).to eq(1)
    end
  end

  describe 'iteration 3' do 
    it 'can show total inventory of all items sold at the market' do 
      @vendor1.stock(@item1, 35)
      @vendor1.stock(@item2, 7)
      @vendor2.stock(@item4, 50)
      @vendor2.stock(@item3, 25)
      @vendor3.stock(@item1, 65)
      @vendor3.stock(item3, 10)
      @market.add_vendor(@vendor1)  
      @market.add_vendor(@vendor2)
      @market.add_vendor(@vendor3)

      expected = { 
        @item1 => {quantity: 100, vendors: [@vendor1, @vendor3]}, 
        @item2 => {quantity: 7, vendors: [@vendor1]}, 
        @item3 => {quantity: 35, vendors: [@vendor2, @vendor3]}, 
        @item4 => {quantity: 50, vendors: [@vendor2]}
      }
      expect(@market.total_inventory).to eq(expected)
    end

    xit 'shows items sold by multiple vendors and quantity over 50' do 
      @vendor1.stock(@item1, 35)
      @vendor1.stock(@item2, 7)
      @vendor2.stock(@item4, 50)
      @vendor2.stock(@item3, 25)
      @vendor3.stock(@item1, 65)
      @vendor3.stock(item3, 10)
      @market.add_vendor(@vendor1)  
      @market.add_vendor(@vendor2)
      @market.add_vendor(@vendor3)
      expect(@market.overstocked_items).to eq([@item1])
    end

    

  end
end