require 'spec_helper'

describe Common do
  describe '#calculate_totalamount' do
    before :all do
      #Order1
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

      @orders1 = [
          Order.new(1, @product1, 12.49),
          Order.new(1, @product2, 14.99),
          Order.new(1, @product3, 0.85)
      ]

      #Order2
      @product4 = Product.new( 4, 'Imported Box of Chocolates',
          ProductType.new(4, 'Imported',
            TypeTax.new(4, 'Importted', 5))
          )
      @product5 = Product.new( 5, 'Imported Bottle of Perfume',
          ProductType.new(5, 'Imported Good',
            TypeTax.new(5, 'NormalImportted', 15))
          )

      @orders2 = [
          Order.new(1, @product4, 10.00),
          Order.new(1, @product5, 47.50)
      ]

      #Order3
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

      @orders3 = [
          Order.new(1, @product6, 18.99),
          Order.new(1, @product7, 9.75),
          Order.new(1, @product8, 11.25),
          Order.new(1, @product9, 27.99)
      ]

      @orders = [
          @orders1,
          @orders2,
          @orders3
      ]

      @products = [
        Product.new( 1, 'Book',
            ProductType.new(1, 'Book',
              TypeTax.new(1, 'Exempt', 0))
            ),
        Product.new( 2, 'Music Cd',
            ProductType.new(2, 'Normal Good',
              TypeTax.new(2, 'Normal', 10))
            ),
        Product.new( 3, 'Chocolate Bar',
            ProductType.new(3, 'Food',
              TypeTax.new(3, 'Exempt', 0))
            ),
        Product.new( 4, 'Imported Box of Chocolates',
            ProductType.new(4, 'Imported',
              TypeTax.new(4, 'Importted', 5))
            ),
        Product.new( 5, 'Imported Bottle of Perfume',
            ProductType.new(5, 'Imported Good',
              TypeTax.new(5, 'NormalImportted', 15))
            ),
        Product.new( 6, 'Bottle of Perfume',
            ProductType.new(6, 'Normal Good',
              TypeTax.new(6, 'Normal', 10))
            ),
        Product.new( 7, 'Packet of Headache Pills',
            ProductType.new(7, 'Medical Product',
              TypeTax.new(7, 'Exempt', 0))
            ),
        Product.new( 8, 'Box of Imported Chocolates',
            ProductType.new(8, 'Imported',
              TypeTax.new(8, 'Importted', 5))
            ),
        Product.new( 9, 'Imported Bottle of Perfume',
            ProductType.new(9, 'Imported Good',
              TypeTax.new(9, 'NormalImportted', 15))
            )
        ]
    end

    before :each do
      @orders.each_with_index do |order,index|
        @core = Common.new(
                  @products,
                  order
                )
        @core.calculate_totalamount(index)
        if index == 0 #order1
          expect(@core.total).to eq 29.83
          expect(@core.sale_tax).to eq 1.50
        elsif index == 1 #order 2
          expect(@core.total).to eq 65.13
          expect(@core.sale_tax).to eq 7.63
        else #order3
          expect(@core.total).to eq 74.64
          expect(@core.sale_tax).to eq 6.66
        end
      end
    end

    specify do
      @core.should be_an_instance_of Common
      expect(File.exists?('./spec/db/output/Order1.csv')).to be true
      expect(File.exists?('./spec/db/output/Order2.csv')).to be true
      expect(File.exists?('./spec/db/output/Order3.csv')).to be true
    end
  end
end