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
require_relative 'lib/disk'
require_relative 'lib/kass'
require_relative 'lib/product_collection'

path = "data"

kass = Kass.new(path)
loop do
  system "cls"
  puts "\n--- Что бы вы хотели купить? Мы можем вам предложить:\n\n"
  kass.show_list_of_goods
  puts "0. Выход\n\n"
  kass.show_cart
  puts "\nСумма: #{kass.total}"
  user_input = STDIN.gets.chomp
  break if user_input == "0"
  item_number = user_input.to_i.abs - 1
  kass.add_to_cart(item_number)
end
puts "\nС вас #{kass.total} руб."
