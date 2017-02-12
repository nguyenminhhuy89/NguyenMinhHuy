require 'spec_helper'

describe TypeTax do
  
  describe '#new' do
    before :each do
      @arrtypetax = TypeTax.new(1, 'test', 10)
      @testnew = @arrtypetax.create_with_tax(50)
    end

    specify do
      @testnew.should be_an_instance_of TypeTax
      expect(@testnew.name).to eq 'export'
      expect(@testnew.tax).to eq 50
    end
  end

  describe '#list' do
    before :all do
      @typetax = [
          TypeTax.new(1, 'Normal', 10),
          TypeTax.new(2, 'NormalImportted', 15),
          TypeTax.new(3, 'Exempt', 0),
          TypeTax.new(4, 'Importted', 5)
      ]
      File.open './spec/db/input/TypeTax.yml', 'w' do |f|
        f.write YAML::dump @typetax
      end
    end

    specify do
      expect(@typetax.count).to eq 4
      expect(@typetax.each_with_index { |typetax,index|
        typetax.should be_an_instance_of TypeTax
        typetax.name.should eq @typetax[index].name
        typetax.tax.should eq @typetax[index].tax
      })
    end
  end
end