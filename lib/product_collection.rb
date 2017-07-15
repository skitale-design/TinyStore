class ProductCollection

  def initialize(array)
    @array = array
  end

  def self.from_dir(path)
    array = []
    # В хэше хранится список соответствия директории и класса товара, который в ней лежит
    # Решил не делать как в примере, поскольку считаю этот способ в данной ситуациии достаточно
    # наглядным
    @hash_for_classes = {
                          "data/book" => Book,
                          "data/disk" => Disk,
                          "data/film" => Film
                        }
    #Для каждой папки по пути path...
    Dir.glob("#{path}/*") do |dir|
      #Для каждого файла в этой папке...
      Dir.glob("#{dir}/*") do |file|
        #Добавить в массив объект класса с идентификатором dir (в хеше прописали соответствие)
        array << @hash_for_classes[dir].from_file(file)
      end
    end
    # Создаем экземпляр класса ProductCollection
    new(array)
  end

  def to_a
    @array
  end
  #Ниже идут публичные методы, которые позволяют сортировать содержимое массива объектов
  #Каждый указывает через приватный метод sort конкретное поле объекта, по которому следует сортировать
  def sort_by_amount!(reverse)
    sort!(:amount, reverse)
  end

  def sort_by_price!(reverse)
    sort!(:price, reverse)
  end

  def sort_by_title!(reverse)
    sort!(:title, reverse)
  end

  #Приватный метод sort может быть вызван только из методов текущего класса
  private
  #Это сделано для защиты классов Book и Film от внешнего доступа через public_send()
  #Потому как через него можно дергать их методы, что неочевидно
  def sort!(param, reverse)
    case reverse
    when 1 then @array.sort_by!{|e| -1 * e.public_send(param)}
    when 0 then @array.sort_by!{|e| e.public_send(param)}
    end
  end
end

