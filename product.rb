class Product
  def initialize (name, price, taxed=false)
  @name = name
  @price = price
  @taxed = taxed
  end

  def total
    if @taxed
      @price * 1.13
    else
      @price
    end
  end
end

class Cart
  def initialize
    @products = []
  end

  def add_product(product)
    @products << product
  end

  def total
    sum = 0
    @products.each do |product|
      sum +=product.total
    end
    sum
  end
end

die_hard = Product.new("Die Hard DVD", 9.99)
interstellar = Product.new("Interstellar", 19.99, true)
cart = Cart.new
cart.add_product(die_hard)
cart.add_product(interstellar)
puts cart.total
