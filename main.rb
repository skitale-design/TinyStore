# XXX/ Этот код необходим только при использовании русских букв на Windows
if (Gem.win_platform?)
  Encoding.default_external = Encoding.find(Encoding.locale_charmap)
  Encoding.default_internal = __ENCODING__

  [STDIN, STDOUT].each do |io|
    io.set_encoding(Encoding.default_external, Encoding.default_internal)
  end
end
# /XXX

require_relative 'lib/product'
require_relative 'lib/book'
require_relative 'lib/film'


# book = Book.new(price: 990, amount: 5)
book = Book.new(990, 5)
puts "#{book.price} рублей"
# puts "Книга #{book.title} стоит #{book.price}. Осталось на складе: #{book.quantity}"
