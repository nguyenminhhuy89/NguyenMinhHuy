require 'spec_helper'
describe ProductType do

  describe '#new' do
    before :each do
      @typetax = TypeTax.new(1, 'test2', 10)
      @prodcuttype = ProductType.new(2, 'test1', @typetax)
    end

    specify do
      expect(@prodcuttype).to be_an_instance_of ProductType
      expect(@prodcuttype.id).to eq 2
      expect(@prodcuttype.name).to eq 'test1'
      expect(@prodcuttype.typetax).to eq @typetax
    end
  end

  describe '#list' do
    before :all do
      @prodcuttypes = [
        ProductType.new(1, 'Book', TypeTax.new(1, 'Normal', 10)),
        ProductType.new(2, 'Food', TypeTax.new(2, 'Exempt', 0)),
        ProductType.new(3, 'Medical Prodcut', TypeTax.new(3, 'Exempt', 0)),
        ProductType.new(4, 'Normal Good', TypeTax.new(4, 'Normal', 10)),
        ProductType.new(5, 'Imported Good', TypeTax.new(5, 'NormalImportted', 15)),
        ProductType.new(6, 'Imported', TypeTax.new(6, 'Importted', 5))
      ]
      File.open './spec/db/input/ProductType.yml', 'w' do |f|
        f.write YAML::dump @prodcuttypes
      end
    end

    specify do
      expect(@prodcuttypes.count).to eq 6
      expect(@prodcuttypes.each_with_index { |prodcuttype,index|
        prodcuttype.should be_an_instance_of ProductType
        prodcuttype.name.should eq @prodcuttypes[index].name
        prodcuttype.typetax.should eq @prodcuttypes[index].typetax
      })
    end
  end
end
