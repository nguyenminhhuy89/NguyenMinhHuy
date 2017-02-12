class Product
  attr_accessor :id, :name, :producttype
  def initialize id, name, producttype
    @id = id
    @name = name
    @producttype = producttype
  end

  def list product
  	@product.push(product)
  end
end