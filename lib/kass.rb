require_relative 'product_collection'

class Kass

  def initialize(path)
    @cart = []
    # Выбираем 5 товаров из общего списка
    @products = ProductCollection.from_dir(path).to_a
      # ).sample(5)
  end

  # Показать список доступных товаров - статический метод
  def show_list_of_goods
    @products.each_with_index do |element, index|
      product_type = case element.class.to_s
                      when "Book" then "Книга"
                      when "Disk" then  "Диск"
                      when "Film" then "Фильм"
                      end
      puts "#{index+1} #{product_type} #{element.to_s}"
    end
  end
  # Добавить товар в корзину
  def add_to_cart(user_input)
    if @products[user_input].amount > 0
      @cart << @products[user_input]
      @products[user_input].amount -= 1
    else
      puts "--> Товара нет на складе <--"
      sleep 1
    end
  end

  def show_cart
    puts "Ваши покупки:"
    @cart.each_with_index {|element,i| puts "#{i+1} #{element.to_s}"}
  end
  # Посчитать ИТОГО
  def total
    total = 0
    @cart.each {|item| total += item.price}
    total
  end


end
