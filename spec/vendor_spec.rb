require './lib/item'
require './lib/vendor'

RSpec.describe Vendor do 
  before :each do 
    @vendor = Vendor.new("Rocky Mountain Fresh")
    @item1 = Item.new({name: 'Peach', price: "$0.75"})
    @item2 = Item.new({name: 'Tomato', price: '$0.50'})
  end

  describe 'iteration 1' do 

    it 'exists' do 
      expect(@vendor).to be_a(Vendor)
    end

    it 'has attributes' do 
      expect(@vendor.name).to eq("Rocky Mountain Fresh")
    end

    it 'has an inventory set intially to an empty hash' do 
      expect(@vendor.inventory).to eq({})
    end

    it 'can check inventory stock as well as stock an item and amount' do 
      expect(@vendor.check_stock(@item1)).to eq(0)

      @vendor.stock(@item1, 30)

      expect(@vendor.inventory).to eq({@item1 => 30})
    end

  end
end