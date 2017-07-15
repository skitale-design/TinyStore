class Kass
  def initialize(path)
    @cart = []
    @products = ProductCollection.from_dir(path).sort_by_price!(1).to_a
  end
  
  # Показать список товаров
  def show_list_of_goods
    @products.each_with_index do |element, index|
      product_type = case element.class.to_s
                     when "Book" then "Книга"
                     when "Disk" then "Диск"
                     when "Film" then "Фильм"
                     end
      puts "#{index + 1} #{product_type} #{element}\n\n"
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
        
  # Показать товары в корзине
  def show_cart
    puts "--- Ваши покупки:"
    @cart.each_with_index {|element,i| puts "#{i + 1} #{element}"}
  end
        
  # Посчитать сумму всех товаров в корзине
  def total
    total = 0
    @cart.each {|item| total += item.price}
    total
  end
end
