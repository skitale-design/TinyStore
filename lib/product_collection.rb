  # Класс должен создавать объект класса Book, если файл он нашел в папке book
  # а если файл лежит в папке film, то должен создать объект класса Film
  # Для этого мы должны передать в конструктор класса соответствующий элемент
  # его мы получим из хэш-таблицы, в которой каждому названию папки будет соответствовать
  # название класса.

class ProductCollection

  def initialize
  end

  def self.from_dir(path)
    arr = []
    @hash_for_classes = {
                      "data/book" => Book,
                      "data/film" => Film
                        }

    Dir.glob("#{path}/*") do |dir|
      puts "----> dir = #{dir}"
      # puts "----> @hash_for_classes[dir] = #{@hash_for_classes[dir]}"
      # puts "\n----> Book.from_file"
      # puts "----> book = #{book.to_s}"
      puts "\n----> Path \"#{dir}/0.txt\""
      object = @hash_for_classes[dir].from_file("#{dir}/0.txt")
      # puts "----> object.class = #{object.class}"
      puts "----> object.genre = #{object.genre}"

# - Что не понятно?
# - не понятно какое имя будет у того объекта, который мы создали
# - А оно должно быть?
# - В смысле?
# - Ну может быть просто складывать его в массив - там у каждого объекта будет свой номер
# - У меня не получается
# - Почему?
# - Почему-то он не хочет создавать объект - вместо этого он выдает мне лишь строку с названием класса


    end
      # puts "----> arr[0].genre = #{arr[0].genre}"
      # puts "----> arr[1].price = #{arr[1].price}"
  end

  def to_a
    return
  end

end
