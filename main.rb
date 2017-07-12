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
book = Book.new(price: 990, amount: 5, title: "Идиот", genre: "Классика", author: "Ф. Достоевский")
film = Film.new(price: 1000, amount: 3, title: "Тарас Бульба", year: "2009", director: "А. Бортко")
puts "#{book.title} #{book.author} (#{book.genre}) #{book.price} рублей"
puts "#{film.title} #{film.director} (#{film.year}) #{film.price} рублей"
# puts "Книга #{book.title} стоит #{book.price}. Осталось на складе: #{book.quantity}"
