class Product
  # attr_reader :price, :quantity
  attr_reader :price, :amount

  def initialize(params)
    @price = params[:price]
    @amount = params[:amount]
  end

  def to_s
    puts "Цена: #{@price}, Количество: #{@amount}"
  end
end
