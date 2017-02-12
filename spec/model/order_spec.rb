require 'spec_helper'

describe Order do
  describe '#new' do
    before :each do
     @product = Product.new(1, 'Booktest', 10)
     @order = Order.new(10, @product, 100.50)
    end

    it 'valid' do
      expect(@order).to be_an_instance_of Order
      expect(@order.price).to eq 100.50
      expect(@order.quantity).to eq 10
      expect(@order.product).to eq @product
    end
  end

  describe '#list_order1' do
    before :each do
      @product1 = Product.new( 1, 'Book',
            ProductType.new(1, 'Book',
              TypeTax.new(1, 'Exempt', 0))
            )
      @product2 = Product.new( 2, 'Music Cd',
          ProductType.new(2, 'Normal Good',
            TypeTax.new(2, 'Normal', 10))
          )
      @product3 = Product.new( 3, 'Chocolate Bar',
          ProductType.new(3, 'Food',
            TypeTax.new(3, 'Exempt', 0))
          )

      @orders = [
          Order.new(1, @product1, 12.49),
          Order.new(1, @product2, 14.99),
          Order.new(1, @product3, 0.85)
      ]
      File.open './spec/db/input/Order1.yml', 'w' do |f|
        f.write YAML::dump @orders
      end
    end

    it 'valid product' do
      expect(@orders.count).to eq 3
      expect(@orders.each {|order| order.should be_an_instance_of Order })
      expect(@orders[0].product).to eq @product1
      expect(@orders[1].product).to eq @product2
      expect(@orders[2].product).to eq @product3
    end

    it 'valid product_name' do
      expect(@orders[0].product.name).to eq 'Book'
    end
  end

  describe '#list_order2' do
    before :each do
      @product4 = Product.new( 4, 'Imported Box of Chocolates',
          ProductType.new(4, 'Imported',
            TypeTax.new(4, 'Importted', 5))
          )
      @product5 = Product.new( 5, 'Imported Bottle of Perfume',
          ProductType.new(5, 'Imported Good',
            TypeTax.new(5, 'NormalImportted', 15))
          )

      @orders = [
          Order.new(1, @product4, 10.00),
          Order.new(1, @product5, 47.50)
      ]
      File.open './spec/db/input/Order2.yml', 'w' do |f|
        f.write YAML::dump @orders
      end
    end

    specify do
      expect(@orders.count).to eq 2
      expect(@orders[0].product).to eq @product4
      expect(@orders[1].product).to eq @product5
    end
  end

  describe '#list_order3' do
    before :each do
      @product6 = Product.new( 6, 'Bottle of Perfume',
          ProductType.new(6, 'Normal Good',
            TypeTax.new(6, 'Normal', 10))
          )
      @product7 = Product.new( 7, 'Packet of Headache Pills',
          ProductType.new(7, 'Medical Product',
            TypeTax.new(7, 'Exempt', 0))
          )
      @product8 = Product.new( 8, 'Box of Imported Chocolates',
          ProductType.new(8, 'Imported',
            TypeTax.new(8, 'Importted', 5))
          )
      @product9 = Product.new( 9, 'Imported Bottle of Perfume',
          ProductType.new(9, 'Imported Good',
            TypeTax.new(9, 'NormalImportted', 15))
          )

      @orders = [
          Order.new(1, @product6, 18.99),
          Order.new(1, @product7, 9.75),
          Order.new(1, @product8, 11.25),
          Order.new(1, @product9, 27.99)
      ]
      File.open './spec/db/input/Order3.yml', 'w' do |f|
        f.write YAML::dump @orders
      end
    end

    specify do
      expect(@orders.count).to eq 4
      expect(@orders[0].product).to eq @product6
      expect(@orders[1].product).to eq @product7
      expect(@orders[2].product).to eq @product8
      expect(@orders[3].product).to eq @product9
      expect(File.exists?('./spec/db/input/Order3.yml')).to be true
      expect(File.exists?('./spec/db/input/Order2.yml')).to be true
      expect(File.exists?('./spec/db/input/Order1.yml')).to be true
    end
  end
end