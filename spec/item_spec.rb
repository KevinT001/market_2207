require './lib/item'

RSpec.describe Item do 
  before :each do 
    @item1 = Item.new({name: 'Peach', price: "$0.75"})
    @item2 = Item.new({name: 'Tomato', price: '$0.50'})
  end


  describe 'iteration 1 :item' do 

    it 'exists' do 
      expect(@item1).to be_a(Item)
      expect(@item2).to be_a(Item)
    end

    it 'has attributes' do 
      expect(@item1.name).to eq("Peach")
      expect(@item2.name).to eq("Tomato")

      expect(@item1.price).to eq(0.75) #Eliminate / delete "$" from price
      expect(@item2.price).to eq(0.5)
    end
  end
end