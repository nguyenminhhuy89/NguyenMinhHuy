class TypeTax
  attr_accessor :id, :name, :tax

  def initialize id, name, tax
    @id = id
    @name = name
    @tax = tax
  end

  def create_with_tax value
  	TypeTax.new(1, 'export', value)
  end
end