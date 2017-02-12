require 'spec_helper'

describe Product do
  describe '#new' do
    before :each do
      @product = Product.new( 1, 'Booktest',
        producttype:
        { id: 1, name: 'Book',
          typetax: { id: 1, name: 'Exempt', tax: 0 }
        })
    end

    specify do
      expect(@product).to be_an_instance_of Product
      expect(@product.id).to eq 1
      expect(@product.name).to eq 'Booktest'
    end
  end

  describe '#list' do
    before :all do
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
      File.open './spec/db/input/Product.yml', 'w' do |f|
        f.write YAML::dump @products
      end
    end

    specify do
      expect(@products.count).to eq 9
      expect(@products.each_with_index { |product,index|
        expect(product.id).to eq @products[index].id
        expect(product.name).to eq @products[index].name
        expect(product.producttype).to eq @products[index].producttype
        expect(product.producttype.typetax).to eq @products[index].producttype.typetax
      })
    end
  end
end