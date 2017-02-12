require 'spec_helper'

describe Common do
  describe '#calculate_totalamount' do
    before :all do
      @orders = [
          './spec/db/input/Order1.yml',
          './spec/db/input/Order2.yml',
          './spec/db/input/Order3.yml'
      ]
      @products = './spec/db/input/Product.yml'
      @producttypes = './spec/db/input/ProductType.yml'
      @typetax = './spec/db/input/TypeTax.yml'
    end

    before :each do
      @orders.each_with_index do |input,index|
        @core = Common.new(
                  @products,
                  input
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
      File.exist?(@orders[0]).should be true
      File.exist?(@orders[1]).should be true
      File.exist?(@orders[2]).should be true
    end
  end
end