require 'ostruct'
class Common
  attr_accessor :total, :sale_tax
  def initialize pathProduct, pathOrder
      @products = YAML::load(File.read(pathProduct))
      @orders = YAML::load(File.read(pathOrder))
      @bills = []
  end

  def calculate_totalamount index
    if @orders.length <= 0
      return 0
    end
    if @products.length <= 0
      return 0
    end
    tax = 0
    @orders.each do |order|
      tax = order.product.producttype.typetax.tax
      @bills.push(Order.new(order.quantity, order.product, (order.quantity * (order.price + (order.price * tax / 100))).round(2)))
    end
    @total = @bills.inject(0){|sum,e| sum += e.price}
    @amount = @orders.inject(0){|sum,e| sum += (e.price * e.quantity)}
    @sale_tax = (@total - @amount).round(2)
    @result = OpenStruct.new
    @result.bills = @bills
    @result.total = @total
    @result.amount = @amount.round(2)
    @result.sale_tax = @sale_tax
    @bills = @result.bills
    File.open "./spec/db/output/Order#{index + 1}.csv", 'w' do |f|
      @bills.each do |bill|
        f.write "#{bill.quantity}, #{bill.product.name}, #{bill.price}\n"
      end
      f.write "Sale tax: #{@result.sale_tax}\n"
      f.write "Total: #{@result.total}\n"
    end
    return @result
  end
end