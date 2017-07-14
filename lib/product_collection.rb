class ProductCollection
  # path = "data"
  @hash_for_classes = {
                      "data/book" => Book,
                      "data/film" => Film
                    }

  def initialize
  end

  def self.from_dir(path)
    Dir.glob("#{path}/*") do |dir|
      puts "----> dir = #{dir}"
      puts "----> @hash_for_classes[dir] = #{@hash_for_classes[dir]}"
      @hash_for_classes[dir].from_file("#{path}/#{dir}/0.txt")
    end
  end

  # Класс должен создавать объект класса Book, если файл он нашел в папке book
  # а если файл лежит в папку film, то должен создать объект класса Film
  # Для этого мы должны передать в конструктор класса соответствующий элемент
  # его мы получим из хэш-таблицы, в которой каждому названию папки будет соответствовать
  # название класса.


  # def from_file(path)
  #   data_array = []
  #   file = File.new(path)
  #   data_array = file.readlines
  #   file.close
  #   data_array
  # end

  def to_a
    return
  end

end
