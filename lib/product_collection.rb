  # Класс должен создавать объект класса Book, если файл он нашел в папке book
  # а если файл лежит в папке film, то должен создать объект класса Film
  # Для этого мы должны передать в конструктор класса соответствующий элемент
  # его мы получим из хэш-таблицы, в которой каждому названию папки будет соответствовать
  # название класса.

class ProductCollection

  def initialize
  end

  def self.from_dir(path)
    array = []
    @hash_for_classes = {
                          "data/book" => Book,
                          "data/film" => Film
                        }

    Dir.glob("#{path}/*") do |dir|
        array << @hash_for_classes[dir].from_file("#{dir}/0.txt")
    end
    array
  end

end

