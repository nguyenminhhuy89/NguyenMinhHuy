class ProductType
  attr_accessor :id, :name, :typetax
  def initialize id, name, typetax
    @id = id
    @name = name
    @typetax = typetax
  end
end