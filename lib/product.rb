class Product
  attr_accessor :price, :amount

  def initialize(params)
    @price = params[:price]
    @amount = params[:amount]
  end

  def to_s
    "#{@price} руб. осталось (#{@amount})"
  end

  def self.from_file(path)
    raise NotImplementedError
  end
end
